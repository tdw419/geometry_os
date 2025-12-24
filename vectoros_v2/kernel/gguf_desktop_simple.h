#pragma once

#include "nested_gguf_filesystem.h"
#include <string>
#include <vector>
#include <functional>

namespace VectorOS {

/**
 * @brief Simple GGUF Desktop Interface
 * 
 * Provides a desktop-like interface for the GGUF OS where users can:
 * - View available GGUF programs
 * - Launch programs with arguments
 * - Install/uninstall GGUF applications
 * - Access system information
 */
class GGUFDesktopSimple {
public:
    GGUFDesktopSimple(const std::string& workspace_root);
    
    /**
     * @brief Initialize the desktop environment
     */
    bool initialize();
    
    /**
     * @brief Show the desktop menu
     */
    void show_menu();
    
    /**
     * @brief Launch a program from the desktop
     */
    bool launch_program(const std::string& program_name, const std::string& args = "");
    
    /**
     * @brief Install a new GGUF program
     */
    bool install_program(const std::string& gguf_path, const std::string& program_name);
    
    /**
     * @brief Uninstall a program
     */
    bool uninstall_program(const std::string& program_name);
    
    /**
     * @brief List all available programs
     */
    void list_programs() const;
    
    /**
     * @brief Show system information
     */
    void show_system_info() const;
    
    /**
     * @brief Run the desktop in interactive mode
     */
    void run_interactive();

private:
    std::string workspace_root_;
    std::unique_ptr<NestedGGUFFilesystem> filesystem_;
    
    void print_header() const;
    void print_footer() const;
    std::string format_size(size_t bytes) const;
    void handle_user_input();
};

} // namespace VectorOS