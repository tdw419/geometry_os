#include "gguf_desktop.h"
#include <iostream>
#include <sstream>
#include <iomanip>

namespace VectorOS {

GGUFDesktop::GGUFDesktop(const std::string& workspace_root) 
    : workspace_root_(workspace_root) {
}

bool GGUFDesktop::initialize() {
    std::cout << "[Desktop] Initializing GGUF Desktop..." << std::endl;
    
    // Initialize filesystem
    filesystem_ = std::make_unique<NestedGGUFFilesystem>(workspace_root_);
    if (!filesystem_->mount()) {
        std::cerr << "[Desktop] Failed to mount filesystem" << std::endl;
        return false;
    }
    
    // Initialize desktop drive
    // For now, we'll create a simple drive without the binder dependency
    // This is a simplified implementation for the demo
    desktop_drive_ = std::make_unique<NeuralProjectDrive>(filesystem_->binary_loader_);
    desktop_drive_->mount(workspace_root_ + "/desktop", "desktop");
    
    std::cout << "[Desktop] Desktop initialized successfully" << std::endl;
    return true;
}

void GGUFDesktop::show_menu() {
    print_header();
    
    std::cout << "Available Commands:\n";
    std::cout << "  1. List Programs     - Show all available GGUF programs\n";
    std::cout << "  2. Launch Program    - Execute a GGUF program\n";
    std::cout << "  3. Install Program   - Install a new GGUF program\n";
    std::cout << "  4. Uninstall Program - Remove a GGUF program\n";
    std::cout << "  5. System Info       - Show system information\n";
    std::cout << "  6. Help              - Show this menu\n";
    std::cout << "  7. Exit              - Quit the desktop\n\n";
    
    print_footer();
}

void GGUFDesktop::print_header() const {
    std::cout << "\n" << std::string(60, '=') << "\n";
    std::cout << "           VECTOROS v2 - GGUF DESKTOP INTERFACE\n";
    std::cout << std::string(60, '=') << "\n\n";
}

void GGUFDesktop::print_footer() const {
    std::cout << std::string(60, '-') << "\n";
    std::cout << "Type 'help' for commands, 'exit' to quit\n";
    std::cout << std::string(60, '=') << "\n\n";
}

std::string GGUFDesktop::format_size(size_t bytes) const {
    if (bytes < 1024) return std::to_string(bytes) + " B";
    if (bytes < 1024 * 1024) return std::to_string(bytes / 1024) + " KB";
    if (bytes < 1024 * 1024 * 1024) return std::to_string(bytes / (1024 * 1024)) + " MB";
    return std::to_string(bytes / (1024 * 1024 * 1024)) + " GB";
}

void GGUFDesktop::list_programs() const {
    auto programs = filesystem_->get_program_info();
    
    if (programs.empty()) {
        std::cout << "No programs installed.\n";
        return;
    }
    
    std::cout << "\nInstalled Programs:\n";
    std::cout << std::string(80, '-') << "\n";
    std::cout << std::left << std::setw(20) << "Name" 
              << std::setw(20) << "Type" 
              << std::setw(20) << "Size" 
              << "Path\n";
    std::cout << std::string(80, '-') << "\n";
    
    for (const auto& program : programs) {
        std::cout << std::left << std::setw(20) << program.name 
                  << std::setw(20) << program.type 
                  << std::setw(20) << format_size(program.size) 
                  << program.path << "\n";
    }
    std::cout << std::string(80, '-') << "\n\n";
}

bool GGUFDesktop::launch_program(const std::string& program_name, const std::string& args) {
    std::cout << "[Desktop] Launching program: " << program_name << std::endl;
    return filesystem_->execute_program(program_name, args);
}

bool GGUFDesktop::install_program(const std::string& gguf_path, const std::string& program_name) {
    std::cout << "[Desktop] Installing program: " << program_name << std::endl;
    return filesystem_->install_program(gguf_path, program_name);
}

bool GGUFDesktop::uninstall_program(const std::string& program_name) {
    std::cout << "[Desktop] Uninstalling program: " << program_name << std::endl;
    return filesystem_->uninstall_program(program_name);
}

void GGUFDesktop::show_system_info() const {
    std::cout << "\nSystem Information:\n";
    std::cout << std::string(40, '-') << "\n";
    std::cout << "Workspace Root: " << workspace_root_ << "\n";
    std::cout << "Programs Installed: " << filesystem_->list_programs().size() << "\n";
    std::cout << "Desktop Drive: Mounted\n";
    std::cout << std::string(40, '-') << "\n\n";
}

void GGUFDesktop::handle_user_input() {
    std::string input;
    std::cout << "> ";
    std::getline(std::cin, input);
    
    std::istringstream iss(input);
    std::string command;
    iss >> command;
    
    if (command == "1" || command == "list") {
        list_programs();
    } else if (command == "2" || command == "launch") {
        std::string program_name, args;
        iss >> program_name;
        std::getline(iss, args); // Get rest as args
        if (!program_name.empty()) {
            launch_program(program_name, args);
        } else {
            std::cout << "Usage: launch <program_name> [args]\n";
        }
    } else if (command == "3" || command == "install") {
        std::string gguf_path, program_name;
        iss >> gguf_path >> program_name;
        if (!gguf_path.empty() && !program_name.empty()) {
            install_program(gguf_path, program_name);
        } else {
            std::cout << "Usage: install <gguf_path> <program_name>\n";
        }
    } else if (command == "4" || command == "uninstall") {
        std::string program_name;
        iss >> program_name;
        if (!program_name.empty()) {
            uninstall_program(program_name);
        } else {
            std::cout << "Usage: uninstall <program_name>\n";
        }
    } else if (command == "5" || command == "info") {
        show_system_info();
    } else if (command == "6" || command == "help") {
        show_menu();
    } else if (command == "7" || command == "exit" || command == "quit") {
        std::cout << "Goodbye!\n";
        exit(0);
    } else {
        std::cout << "Unknown command. Type 'help' for available commands.\n";
    }
}

void GGUFDesktop::run_interactive() {
    std::cout << "\nWelcome to VectorOS v2 GGUF Desktop!\n";
    show_menu();
    
    while (true) {
        handle_user_input();
    }
}

} // namespace VectorOS