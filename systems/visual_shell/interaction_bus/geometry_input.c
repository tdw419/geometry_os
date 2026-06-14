/*
 * geometry_input.c - Visual Interaction Bus Kernel Module
 *
 * Captures HID events and writes directly to VRAM via DMA-BUF.
 * This is the bridge between physical devices and the Glyph VM.
 */

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/input.h>
#include <linux/slab.h>
#include <linux/dma-buf.h>
#include <linux/ktime.h>
#include <linux/uaccess.h>
#include <linux/types.h>
#include <linux/printk.h>

#define EVENT_QUEUE_SIZE 1024
static int input_queue_dmabuf_fd = -1;  // Module parameter for DMA-BUF FD
module_param(input_queue_dmabuf_fd, int, 0444);
MODULE_PARM_DESC(input_queue_dmabuf_fd, "FD of DMA-BUF containing input event queue");

struct input_event_geos {
    uint64_t timestamp_ns;
    uint32_t event_type;
    uint32_t device_id;
    float x;
    float y;
    float dx;
    float dy;
    uint32_t code;
    uint32_t modifiers;
};

struct event_queue_header {
    uint32_t head;
    uint32_t tail;
    uint32_t capacity;
    uint32_t _padding;
};

struct geometry_input_state {
    struct input_handler handler;
    struct event_queue_header *header;
    struct input_event_geos *queue;
    void *vram_ptr;
    struct dma_buf *dmabuf;
};

static struct geometry_input_state *geos_state;

static void geos_input_event(struct input_handle *handle, unsigned int type,
                           unsigned int code, int value)
{
    struct geometry_input_state *state = handle->private;
    struct input_event_geos *event;
    uint32_t next_head;

    if (!state->header || !state->queue) return;

    next_head = (state->header->head + 1) % state->header->capacity;
    if (next_head == state->header->tail) {
        // Queue full - drop event
        return;
    }

    event = &state->queue[state->header->head];
    event->timestamp_ns = ktime_get_ns();
    event->code = code;

    if (type == EV_REL) {
        if (code == REL_X) {
            event->event_type = 1; // MouseMove
            event->dx = (float)value;
        } else if (code == REL_Y) {
            event->event_type = 1; // MouseMove
            event->dy = (float)value;
        }
    } else if (type == EV_KEY) {
        if (code == BTN_LEFT || code == BTN_RIGHT) {
            event->event_type = (value) ? 2 : 3; // MouseDown : MouseUp
        } else {
            event->event_type = (value) ? 4 : 5; // KeyDown : KeyUp
        }
    }

    state->header->head = next_head;
}

static int geos_input_connect(struct input_handler *handler, struct input_dev *dev,
                            const struct input_device_id *id)
{
    struct input_handle *handle;
    int error;

    handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
    if (!handle) return -ENOMEM;

    handle->dev = dev;
    handle->handler = handler;
    handle->name = "geos-input";
    handle->private = geos_state;

    error = input_register_handle(handle);
    if (error) goto err_free_handle;

    error = input_open_device(handle);
    if (error) goto err_unregister_handle;

    return 0;

err_unregister_handle:
    input_unregister_handle(handle);
err_free_handle:
    kfree(handle);
    return error;
}

static void geos_input_disconnect(struct input_handle *handle)
{
    input_close_device(handle);
    input_unregister_handle(handle);
    kfree(handle);
}

static const struct input_device_id geos_input_ids[] = {
    { .driver_info = 1 },	/* Matches all devices */
    { },			/* Terminating entry */
};

MODULE_DEVICE_TABLE(input, geos_input_ids);

static struct input_handler geos_input_handler = {
    .event =	geos_input_event,
    .connect =	geos_input_connect,
    .disconnect =	geos_input_disconnect,
    .name =		"geometry_input",
    .id_table =	geos_input_ids,
};

static int __init geos_input_init(void)
{
    int ret;
    geos_state = kzalloc(sizeof(struct geometry_input_state), GFP_KERNEL);
    if (!geos_state) return -ENOMEM;

    // Import DMA-BUF exported by geometry_os (userspace or kernel)
    // For now, we assume the DMA-BUF FD is passed via module parameter input_queue_dmabuf_fd
    if (input_queue_dmabuf_fd < 0) {
        pr_err("geometry_input: No DMA-BUF FD provided\n");
        kfree(geos_state);
        return -EINVAL;
    }

    geos_state->dmabuf = dma_buf_get(input_queue_dmabuf_fd);
    if (IS_ERR(geos_state->dmabuf)) {
        pr_err("geometry_input: Failed to get DMA-BUF\n");
        kfree(geos_state);
        return PTR_ERR(geos_state->dmabuf);
    }

    // Map DMA-BUF into kernel virtual address space
    geos_state->vram_ptr = dma_buf_vmap(geos_state->dmabuf);
    if (IS_ERR(geos_state->vram_ptr)) {
        pr_err("geometry_input: Failed to vmap DMA-BUF\n");
        dma_buf_put(geos_state->dmabuf);
        kfree(geos_state);
        return PTR_ERR(geos_state->vram_ptr);
    }

    geos_state->header = (struct event_queue_header *)geos_state->vram_ptr;
    geos_state->queue = (struct input_event_geos *)(geos_state->vram_ptr + sizeof(struct event_queue_header));
    geos_state->header->capacity = EVENT_QUEUE_SIZE;

    // Initialize queue to empty state
    geos_state->header->head = 0;
    geos_state->header->tail = 0;

    return input_register_handler(&geos_input_handler);
}

static void __exit geos_input_exit(void)
{
    input_unregister_handler(&geos_input_handler);
    kfree(geos_state->vram_ptr);
    kfree(geos_state);
}

module_init(geos_input_init);
module_exit(geos_input_exit);

MODULE_AUTHOR("Geometry OS");
MODULE_DESCRIPTION("Visual Interaction Bus Input Handler");
MODULE_LICENSE("GPL");
