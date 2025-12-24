#ifndef NEURAL_IDE_COMPONENTS_H
#define NEURAL_IDE_COMPONENTS_H

#include <string>
#include <vector>
#include <memory>
#include <functional>
#include <unordered_map>
#include <mutex>
#include <atomic>

namespace vectoros_v2 {

/**
 * @brief Modular component architecture for NeuralIDE
 * 
 * This header defines the core UI components that make up the NeuralIDE interface.
 * Each component is designed to be self-contained and customizable.
 */

// Forward declarations
class NeuralIDEToolbar;
class NeuralIDESettingsDialog;
class NeuralIDEFileExplorer;
class NeuralIDECodeEditor;
class NeuralIDEOutputPanel;

/**
 * @brief Base component interface for all IDE components
 */
class NeuralIDEComponent {
public:
    virtual ~NeuralIDEComponent() = default;
    
    virtual std::string get_component_id() const = 0;
    virtual std::string get_component_name() const = 0;
    virtual bool is_visible() const = 0;
    virtual void set_visible(bool visible) = 0;
    virtual void render() = 0;
    virtual void update() = 0;
    virtual void handle_input(const std::string& input) = 0;
};

/**
 * @brief Toolbar component with customizable buttons
 */
class NeuralIDEToolbar : public NeuralIDEComponent {
public:
    struct ToolbarButton {
        std::string id;
        std::string label;
        std::string icon;
        std::function<void()> callback;
        bool enabled;
    };

    NeuralIDEToolbar();
    ~NeuralIDEToolbar() override = default;

    std::string get_component_id() const override { return "toolbar"; }
    std::string get_component_name() const override { return "Main Toolbar"; }
    bool is_visible() const override { return visible_; }
    void set_visible(bool visible) override { visible_ = visible; }
    
    void render() override;
    void update() override;
    void handle_input(const std::string& input) override;

    // Toolbar-specific methods
    void add_button(const ToolbarButton& button);
    void remove_button(const std::string& button_id);
    void enable_button(const std::string& button_id, bool enabled);
    std::vector<ToolbarButton> get_buttons() const;

private:
    std::vector<ToolbarButton> buttons_;
    mutable std::mutex buttons_mutex_;
    std::atomic<bool> visible_{true};
};

/**
 * @brief Settings dialog for IDE customization
 */
class NeuralIDESettingsDialog : public NeuralIDEComponent {
public:
    struct SettingCategory {
        std::string id;
        std::string name;
        std::vector<std::string> settings;
        
        SettingCategory(const std::string& id_val, const std::vector<std::string>& settings_val)
            : id(id_val), name(id_val), settings(settings_val) {}
    };

    NeuralIDESettingsDialog();
    ~NeuralIDESettingsDialog() override = default;

    std::string get_component_id() const override { return "settings_dialog"; }
    std::string get_component_name() const override { return "Settings Dialog"; }
    bool is_visible() const override { return visible_; }
    void set_visible(bool visible) override { visible_ = visible; }
    
    void render() override;
    void update() override;
    void handle_input(const std::string& input) override;

    // Settings-specific methods
    void add_setting(const std::string& category, const std::string& key, const std::string& value);
    void remove_setting(const std::string& category, const std::string& key);
    std::string get_setting(const std::string& category, const std::string& key) const;
    std::vector<SettingCategory> get_categories() const;
    bool apply_settings();
    bool reset_to_defaults();

private:
    std::unordered_map<std::string, std::unordered_map<std::string, std::string>> settings_;
    std::unordered_map<std::string, std::string> default_settings_;
    std::vector<SettingCategory> categories_;
    mutable std::mutex settings_mutex_;
    std::atomic<bool> visible_{false};
    std::atomic<bool> dirty_{false}; // Indicates if settings have been modified
};

/**
 * @brief File explorer component
 */
class NeuralIDEFileExplorer : public NeuralIDEComponent {
public:
    struct FileItem {
        std::string path;
        std::string name;
        bool is_directory;
        std::string last_modified;
        size_t size;
    };

    NeuralIDEFileExplorer();
    ~NeuralIDEFileExplorer() override = default;

    std::string get_component_id() const override { return "file_explorer"; }
    std::string get_component_name() const override { return "File Explorer"; }
    bool is_visible() const override { return visible_; }
    void set_visible(bool visible) override { visible_ = visible; }
    
    void render() override;
    void update() override;
    void handle_input(const std::string& input) override;

    // File explorer-specific methods
    void set_root_path(const std::string& path);
    std::string get_root_path() const;
    std::vector<FileItem> get_current_directory_contents() const;
    bool navigate_to(const std::string& path);
    bool refresh_directory();
    std::string get_selected_file() const;
    void set_file_selected_callback(std::function<void(const std::string&)> callback);

private:
    std::string root_path_;
    std::string current_path_;
    std::vector<FileItem> current_contents_;
    std::string selected_file_;
    std::function<void(const std::string&)> file_selected_callback_;
    mutable std::mutex explorer_mutex_;
    std::atomic<bool> visible_{true};
    std::atomic<bool> needs_refresh_{true};
};

/**
 * @brief Code editor component with syntax highlighting
 */
class NeuralIDECodeEditor : public NeuralIDEComponent {
public:
    struct SyntaxHighlightRule {
        std::string pattern;
        std::string color;
        std::string style;
    };

    NeuralIDECodeEditor();
    ~NeuralIDECodeEditor() override = default;

    std::string get_component_id() const override { return "code_editor"; }
    std::string get_component_name() const override { return "Code Editor"; }
    bool is_visible() const override { return visible_; }
    void set_visible(bool visible) override { visible_ = visible; }
    
    void render() override;
    void update() override;
    void handle_input(const std::string& input) override;

    // Code editor-specific methods
    void set_content(const std::string& content);
    std::string get_content() const;
    void set_language(const std::string& language);
    std::string get_language() const;
    void set_line_number(int line);
    int get_line_number() const;
    void set_column(int column);
    int get_column() const;
    void add_syntax_highlight_rule(const SyntaxHighlightRule& rule);
    std::vector<SyntaxHighlightRule> get_syntax_rules() const;
    void set_theme(const std::string& theme_name);
    std::string get_theme() const;
    void set_font_family(const std::string& font_family);
    std::string get_font_family() const;
    void set_font_size(int size);
    int get_font_size() const;

private:
    std::string content_;
    std::string language_;
    int current_line_{1};
    int current_column_{1};
    std::vector<SyntaxHighlightRule> syntax_rules_;
    std::string theme_;
    std::string font_family_;
    int font_size_{14};
    mutable std::mutex editor_mutex_;
    std::atomic<bool> visible_{true};
    std::atomic<bool> content_modified_{false};
};

/**
 * @brief Output panel for logs and results
 */
class NeuralIDEOutputPanel : public NeuralIDEComponent {
public:
    enum OutputType {
        INFO,
        WARNING,
        ERROR,
        SUCCESS
    };

    struct OutputMessage {
        OutputType type;
        std::string timestamp;
        std::string source;
        std::string message;
    };

    NeuralIDEOutputPanel();
    ~NeuralIDEOutputPanel() override = default;

    std::string get_component_id() const override { return "output_panel"; }
    std::string get_component_name() const override { return "Output Panel"; }
    bool is_visible() const override { return visible_; }
    void set_visible(bool visible) override { visible_ = visible; }
    
    void render() override;
    void update() override;
    void handle_input(const std::string& input) override;

    // Output panel-specific methods
    void add_message(OutputType type, const std::string& source, const std::string& message);
    void clear_messages();
    std::vector<OutputMessage> get_messages() const;
    void set_filter(OutputType type, bool enabled);
    bool get_filter(OutputType type) const;
    void set_max_messages(size_t max_count);
    size_t get_max_messages() const;
    void save_to_file(const std::string& file_path);
    void load_from_file(const std::string& file_path);

private:
    std::vector<OutputMessage> messages_;
    std::unordered_map<OutputType, bool> filters_;
    size_t max_messages_{1000};
    mutable std::mutex output_mutex_;
    std::atomic<bool> visible_{true};
    std::atomic<bool> needs_update_{true};
};

/**
 * @brief Component manager for managing all IDE components
 */
class NeuralIDEComponentManager {
public:
    NeuralIDEComponentManager();
    ~NeuralIDEComponentManager();

    // Component management
    void register_component(std::shared_ptr<NeuralIDEComponent> component);
    void unregister_component(const std::string& component_id);
    std::shared_ptr<NeuralIDEComponent> get_component(const std::string& component_id);
    
    // Batch operations
    void render_all();
    void update_all();
    void handle_input_all(const std::string& input);
    void set_all_visible(bool visible);
    
    // Component queries
    std::vector<std::string> get_component_ids() const;
    std::vector<std::shared_ptr<NeuralIDEComponent>> get_all_components() const;
    size_t get_component_count() const;

private:
    std::unordered_map<std::string, std::shared_ptr<NeuralIDEComponent>> components_;
    mutable std::mutex components_mutex_;
};

} // namespace vectoros_v2

#endif // NEURAL_IDE_COMPONENTS_H