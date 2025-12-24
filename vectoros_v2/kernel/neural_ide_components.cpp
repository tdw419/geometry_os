#include "neural_ide_components.h"
#include <iostream>
#include <sstream>
#include <algorithm>
#include <chrono>
#include <iomanip>

namespace vectoros_v2 {

// NeuralIDEToolbar Implementation
NeuralIDEToolbar::NeuralIDEToolbar() {
    // Add default buttons
    add_button({"new_file", "New File", "📄", [](){ std::cout << "[IDE] Creating new file..." << std::endl; }, true});
    add_button({"open_file", "Open File", "📂", [](){ std::cout << "[IDE] Opening file..." << std::endl; }, true});
    add_button({"save", "Save", "💾", [](){ std::cout << "[IDE] Saving file..." << std::endl; }, true});
    add_button({"compile", "Compile", "⚙️", [](){ std::cout << "[IDE] Compiling..." << std::endl; }, true});
    add_button({"run", "Run", "▶️", [](){ std::cout << "[IDE] Running..." << std::endl; }, true});
    add_button({"settings", "Settings", "⚙️", [](){ std::cout << "[IDE] Opening settings..." << std::endl; }, true});
}

void NeuralIDEToolbar::render() {
    if (!visible_) return;

    std::lock_guard<std::mutex> lock(buttons_mutex_);
    std::cout << "\n=== NEURAL IDE TOOLBAR ===" << std::endl;
    std::cout << "Available Actions:" << std::endl;
    
    for (const auto& button : buttons_) {
        std::string status = button.enabled ? "[ENABLED]" : "[DISABLED]";
        std::cout << "  " << button.icon << " " << button.label << " (" << button.id << ") " << status << std::endl;
    }
    std::cout << "==========================" << std::endl;
}

void NeuralIDEToolbar::update() {
    // Toolbar updates - check button states
    std::lock_guard<std::mutex> lock(buttons_mutex_);
    for (auto& button : buttons_) {
        // Update button states based on IDE context
        // This is where you'd check if files are open, compilation state, etc.
    }
}

void NeuralIDEToolbar::handle_input(const std::string& input) {
    std::lock_guard<std::mutex> lock(buttons_mutex_);
    
    for (const auto& button : buttons_) {
        if (button.id == input && button.enabled && button.callback) {
            button.callback();
            break;
        }
    }
}

void NeuralIDEToolbar::add_button(const ToolbarButton& button) {
    std::lock_guard<std::mutex> lock(buttons_mutex_);
    buttons_.push_back(button);
}

void NeuralIDEToolbar::remove_button(const std::string& button_id) {
    std::lock_guard<std::mutex> lock(buttons_mutex_);
    buttons_.erase(
        std::remove_if(buttons_.begin(), buttons_.end(),
                      [&button_id](const ToolbarButton& btn) {
                          return btn.id == button_id;
                      }),
        buttons_.end()
    );
}

void NeuralIDEToolbar::enable_button(const std::string& button_id, bool enabled) {
    std::lock_guard<std::mutex> lock(buttons_mutex_);
    auto it = std::find_if(buttons_.begin(), buttons_.end(),
                          [&button_id](const ToolbarButton& btn) {
                              return btn.id == button_id;
                          });
    if (it != buttons_.end()) {
        it->enabled = enabled;
    }
}

std::vector<NeuralIDEToolbar::ToolbarButton> NeuralIDEToolbar::get_buttons() const {
    std::lock_guard<std::mutex> lock(buttons_mutex_);
    return buttons_;
}

// NeuralIDESettingsDialog Implementation
NeuralIDESettingsDialog::NeuralIDESettingsDialog() {
    // Initialize default settings
    default_settings_ = {
        {"theme", "dark_glass"},
        {"font_family", "JetBrains Mono"},
        {"font_size", "14"},
        {"accent_color", "#00FF99"},
        {"layout", "standard"},
        {"auto_save", "true"},
        {"line_numbers", "true"},
        {"syntax_highlighting", "true"},
        {"word_wrap", "false"},
        {"tab_size", "4"}
    };
    
    // Initialize categories
    categories_.push_back(SettingCategory{"Appearance", std::vector<std::string>{"theme", "font_family", "font_size", "accent_color"}});
    categories_.push_back(SettingCategory{"Editor", std::vector<std::string>{"line_numbers", "syntax_highlighting", "word_wrap", "tab_size"}});
    categories_.push_back(SettingCategory{"Behavior", std::vector<std::string>{"auto_save", "layout"}});
    
    // Set initial settings to defaults
    for (const auto& [key, value] : default_settings_) {
        settings_["General"][key] = value;
    }
}

void NeuralIDESettingsDialog::render() {
    if (!visible_) return;

    std::lock_guard<std::mutex> lock(settings_mutex_);
    std::cout << "\n=== NEURAL IDE SETTINGS ===" << std::endl;
    
    for (const auto& category : categories_) {
        std::cout << "\n--- " << category.name << " ---" << std::endl;
        for (const auto& setting_key : category.settings) {
            auto it = settings_["General"].find(setting_key);
            std::string value = (it != settings_["General"].end()) ? it->second : "Not Set";
            std::cout << "  " << setting_key << ": " << value << std::endl;
        }
    }
    
    std::cout << "\nSettings " << (dirty_ ? "modified" : "unchanged") << std::endl;
    std::cout << "==========================" << std::endl;
}

void NeuralIDESettingsDialog::update() {
    // Check for changes and update dirty flag
    std::lock_guard<std::mutex> lock(settings_mutex_);
    // In a real implementation, this would check against the current state
}

void NeuralIDESettingsDialog::handle_input(const std::string& input) {
    std::lock_guard<std::mutex> lock(settings_mutex_);
    
    // Parse input like "theme=light" or "font_size=16"
    size_t equals_pos = input.find('=');
    if (equals_pos != std::string::npos) {
        std::string key = input.substr(0, equals_pos);
        std::string value = input.substr(equals_pos + 1);
        
        add_setting("General", key, value);
        dirty_ = true;
    }
}

void NeuralIDESettingsDialog::add_setting(const std::string& category, const std::string& key, const std::string& value) {
    std::lock_guard<std::mutex> lock(settings_mutex_);
    settings_[category][key] = value;
    dirty_ = true;
}

void NeuralIDESettingsDialog::remove_setting(const std::string& category, const std::string& key) {
    std::lock_guard<std::mutex> lock(settings_mutex_);
    settings_[category].erase(key);
    dirty_ = true;
}

std::string NeuralIDESettingsDialog::get_setting(const std::string& category, const std::string& key) const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(settings_mutex_));
    auto cat_it = settings_.find(category);
    if (cat_it != settings_.end()) {
        auto key_it = cat_it->second.find(key);
        if (key_it != cat_it->second.end()) {
            return key_it->second;
        }
    }
    return "";
}

std::vector<NeuralIDESettingsDialog::SettingCategory> NeuralIDESettingsDialog::get_categories() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(settings_mutex_));
    return categories_;
}

bool NeuralIDESettingsDialog::apply_settings() {
    std::lock_guard<std::mutex> lock(settings_mutex_);
    if (!dirty_) return true;
    
    // Apply settings to the IDE
    // This would update the actual IDE configuration
    std::cout << "[IDE] Applying settings..." << std::endl;
    
    dirty_ = false;
    return true;
}

bool NeuralIDESettingsDialog::reset_to_defaults() {
    std::lock_guard<std::mutex> lock(settings_mutex_);
    
    settings_.clear();
    for (const auto& [key, value] : default_settings_) {
        settings_["General"][key] = value;
    }
    
    dirty_ = false;
    return true;
}

// NeuralIDEFileExplorer Implementation
NeuralIDEFileExplorer::NeuralIDEFileExplorer() {
    // Default root is current directory
    set_root_path(".");
}

void NeuralIDEFileExplorer::render() {
    if (!visible_) return;

    std::lock_guard<std::mutex> lock(explorer_mutex_);
    std::cout << "\n=== FILE EXPLORER ===" << std::endl;
    std::cout << "Root: " << root_path_ << std::endl;
    std::cout << "Current: " << current_path_ << std::endl;
    std::cout << "\nContents:" << std::endl;
    
    for (const auto& item : current_contents_) {
        std::string type = item.is_directory ? "[DIR] " : "[FILE]";
        std::cout << "  " << type << " " << item.name << " (" << item.size << " bytes)" << std::endl;
    }
    std::cout << "=====================" << std::endl;
}

void NeuralIDEFileExplorer::update() {
    if (needs_refresh_.load()) {
        refresh_directory();
        needs_refresh_.store(false);
    }
}

void NeuralIDEFileExplorer::handle_input(const std::string& input) {
    std::lock_guard<std::mutex> lock(explorer_mutex_);
    
    if (input == "refresh") {
        refresh_directory();
    } else if (input.substr(0, 4) == "cd ") {
        std::string path = input.substr(4);
        navigate_to(path);
    }
}

void NeuralIDEFileExplorer::set_root_path(const std::string& path) {
    std::lock_guard<std::mutex> lock(explorer_mutex_);
    root_path_ = path;
    current_path_ = path;
    needs_refresh_.store(true);
}

std::string NeuralIDEFileExplorer::get_root_path() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(explorer_mutex_));
    return root_path_;
}

std::vector<NeuralIDEFileExplorer::FileItem> NeuralIDEFileExplorer::get_current_directory_contents() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(explorer_mutex_));
    return current_contents_;
}

bool NeuralIDEFileExplorer::navigate_to(const std::string& path) {
    std::lock_guard<std::mutex> lock(explorer_mutex_);
    // Simplified navigation - in real implementation would use filesystem
    current_path_ = path;
    needs_refresh_.store(true);
    return true;
}

bool NeuralIDEFileExplorer::refresh_directory() {
    std::lock_guard<std::mutex> lock(explorer_mutex_);
    
    // Simulate directory contents
    current_contents_.clear();
    
    // Add some sample files
    current_contents_.push_back({"sample.cpp", "sample.cpp", false, "2025-12-24", 1024});
    current_contents_.push_back({"config.json", "config.json", false, "2025-12-24", 512});
    current_contents_.push_back({"src", "src", true, "2025-12-24", 0});
    current_contents_.push_back({"docs", "docs", true, "2025-12-24", 0});
    
    return true;
}

std::string NeuralIDEFileExplorer::get_selected_file() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(explorer_mutex_));
    return selected_file_;
}

void NeuralIDEFileExplorer::set_file_selected_callback(std::function<void(const std::string&)> callback) {
    std::lock_guard<std::mutex> lock(explorer_mutex_);
    file_selected_callback_ = callback;
}

// NeuralIDECodeEditor Implementation
NeuralIDECodeEditor::NeuralIDECodeEditor() {
    theme_ = "dark_glass";
    font_family_ = "JetBrains Mono";
    font_size_ = 14;
    
    // Add default syntax highlighting rules
    add_syntax_highlight_rule({"#include", "blue", "bold"});
    add_syntax_highlight_rule({"int|float|double|char|bool", "yellow", "bold"});
    add_syntax_highlight_rule({"if|else|for|while|switch|case", "green", "bold"});
    add_syntax_highlight_rule({"//.*", "gray", "italic"});
    add_syntax_highlight_rule({"/\\*.*\\*/", "gray", "italic"});
}

void NeuralIDECodeEditor::render() {
    if (!visible_) return;

    std::lock_guard<std::mutex> lock(editor_mutex_);
    std::cout << "\n=== CODE EDITOR ===" << std::endl;
    std::cout << "Language: " << language_ << std::endl;
    std::cout << "Theme: " << theme_ << std::endl;
    std::cout << "Font: " << font_family_ << " " << font_size_ << "pt" << std::endl;
    std::cout << "Position: Line " << current_line_ << ", Column " << current_column_ << std::endl;
    std::cout << "\nContent Preview:" << std::endl;
    
    // Show first few lines of content
    std::istringstream stream(content_);
    std::string line;
    int line_num = 1;
    while (std::getline(stream, line) && line_num <= 5) {
        std::cout << line_num << ": " << line << std::endl;
        line_num++;
    }
    if (line_num > 5) {
        std::cout << "... (truncated)" << std::endl;
    }
    std::cout << "===================" << std::endl;
}

void NeuralIDECodeEditor::update() {
    if (content_modified_.load()) {
        // Update syntax highlighting, line numbers, etc.
        content_modified_.store(false);
    }
}

void NeuralIDECodeEditor::handle_input(const std::string& input) {
    std::lock_guard<std::mutex> lock(editor_mutex_);
    
    if (input.substr(0, 7) == "insert ") {
        content_ += input.substr(7) + "\n";
        content_modified_.store(true);
    } else if (input.substr(0, 9) == "language ") {
        set_language(input.substr(9));
    }
}

void NeuralIDECodeEditor::set_content(const std::string& content) {
    std::lock_guard<std::mutex> lock(editor_mutex_);
    content_ = content;
    content_modified_.store(true);
}

std::string NeuralIDECodeEditor::get_content() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(editor_mutex_));
    return content_;
}

void NeuralIDECodeEditor::set_language(const std::string& language) {
    std::lock_guard<std::mutex> lock(editor_mutex_);
    language_ = language;
    content_modified_.store(true);
}

std::string NeuralIDECodeEditor::get_language() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(editor_mutex_));
    return language_;
}

void NeuralIDECodeEditor::set_line_number(int line) {
    std::lock_guard<std::mutex> lock(editor_mutex_);
    current_line_ = line;
}

int NeuralIDECodeEditor::get_line_number() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(editor_mutex_));
    return current_line_;
}

void NeuralIDECodeEditor::set_column(int column) {
    std::lock_guard<std::mutex> lock(editor_mutex_);
    current_column_ = column;
}

int NeuralIDECodeEditor::get_column() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(editor_mutex_));
    return current_column_;
}

void NeuralIDECodeEditor::add_syntax_highlight_rule(const SyntaxHighlightRule& rule) {
    std::lock_guard<std::mutex> lock(editor_mutex_);
    syntax_rules_.push_back(rule);
}

std::vector<NeuralIDECodeEditor::SyntaxHighlightRule> NeuralIDECodeEditor::get_syntax_rules() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(editor_mutex_));
    return syntax_rules_;
}

void NeuralIDECodeEditor::set_theme(const std::string& theme_name) {
    std::lock_guard<std::mutex> lock(editor_mutex_);
    theme_ = theme_name;
}

std::string NeuralIDECodeEditor::get_theme() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(editor_mutex_));
    return theme_;
}

void NeuralIDECodeEditor::set_font_family(const std::string& font_family) {
    std::lock_guard<std::mutex> lock(editor_mutex_);
    font_family_ = font_family;
}

std::string NeuralIDECodeEditor::get_font_family() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(editor_mutex_));
    return font_family_;
}

void NeuralIDECodeEditor::set_font_size(int size) {
    std::lock_guard<std::mutex> lock(editor_mutex_);
    font_size_ = size;
}

int NeuralIDECodeEditor::get_font_size() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(editor_mutex_));
    return font_size_;
}

// NeuralIDEOutputPanel Implementation
NeuralIDEOutputPanel::NeuralIDEOutputPanel() {
    // Initialize filters
    filters_[INFO] = true;
    filters_[WARNING] = true;
    filters_[ERROR] = true;
    filters_[SUCCESS] = true;
    
    // Add some sample messages
    add_message(INFO, "IDE", "NeuralIDE initialized successfully");
    add_message(SUCCESS, "Compiler", "Build completed without errors");
}

void NeuralIDEOutputPanel::render() {
    if (!visible_) return;

    std::lock_guard<std::mutex> lock(output_mutex_);
    std::cout << "\n=== OUTPUT PANEL ===" << std::endl;
    
    for (const auto& message : messages_) {
        if (!filters_[message.type]) continue;
        
        std::string type_str;
        switch (message.type) {
            case INFO: type_str = "[INFO]"; break;
            case WARNING: type_str = "[WARNING]"; break;
            case ERROR: type_str = "[ERROR]"; break;
            case SUCCESS: type_str = "[SUCCESS]"; break;
        }
        
        std::cout << message.timestamp << " " << type_str << " [" << message.source << "] " << message.message << std::endl;
    }
    std::cout << "====================" << std::endl;
}

void NeuralIDEOutputPanel::update() {
    if (needs_update_.load()) {
        // Update display if needed
        needs_update_.store(false);
    }
}

void NeuralIDEOutputPanel::handle_input(const std::string& input) {
    std::lock_guard<std::mutex> lock(output_mutex_);
    
    if (input == "clear") {
        clear_messages();
    } else if (input.substr(0, 7) == "filter ") {
        std::string filter_type = input.substr(7);
        // Toggle filter
        if (filter_type == "info") filters_[INFO] = !filters_[INFO];
        else if (filter_type == "warning") filters_[WARNING] = !filters_[WARNING];
        else if (filter_type == "error") filters_[ERROR] = !filters_[ERROR];
        else if (filter_type == "success") filters_[SUCCESS] = !filters_[SUCCESS];
    }
}

void NeuralIDEOutputPanel::add_message(OutputType type, const std::string& source, const std::string& message) {
    std::lock_guard<std::mutex> lock(output_mutex_);
    
    // Add timestamp
    auto now = std::chrono::system_clock::now();
    auto time_t = std::chrono::system_clock::to_time_t(now);
    std::stringstream ss;
    ss << std::put_time(std::localtime(&time_t), "%H:%M:%S");
    
    OutputMessage msg;
    msg.type = type;
    msg.timestamp = ss.str();
    msg.source = source;
    msg.message = message;
    
    messages_.push_back(msg);
    
    // Limit message count
    if (messages_.size() > max_messages_) {
        messages_.erase(messages_.begin());
    }
    
    needs_update_.store(true);
}

void NeuralIDEOutputPanel::clear_messages() {
    std::lock_guard<std::mutex> lock(output_mutex_);
    messages_.clear();
    needs_update_.store(true);
}

std::vector<NeuralIDEOutputPanel::OutputMessage> NeuralIDEOutputPanel::get_messages() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(output_mutex_));
    return messages_;
}

void NeuralIDEOutputPanel::set_filter(OutputType type, bool enabled) {
    std::lock_guard<std::mutex> lock(output_mutex_);
    filters_[type] = enabled;
}

bool NeuralIDEOutputPanel::get_filter(OutputType type) const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(output_mutex_));
    auto it = filters_.find(type);
    return (it != filters_.end()) ? it->second : false;
}

void NeuralIDEOutputPanel::set_max_messages(size_t max_count) {
    std::lock_guard<std::mutex> lock(output_mutex_);
    max_messages_ = max_count;
    
    // Trim messages if needed
    if (messages_.size() > max_messages_) {
        messages_.erase(messages_.begin(), messages_.end() - max_messages_);
    }
}

size_t NeuralIDEOutputPanel::get_max_messages() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(output_mutex_));
    return max_messages_;
}

void NeuralIDEOutputPanel::save_to_file(const std::string& file_path) {
    std::lock_guard<std::mutex> lock(output_mutex_);
    // Implementation would save messages to file
    std::cout << "[IDE] Saving output to " << file_path << std::endl;
}

void NeuralIDEOutputPanel::load_from_file(const std::string& file_path) {
    std::lock_guard<std::mutex> lock(output_mutex_);
    // Implementation would load messages from file
    std::cout << "[IDE] Loading output from " << file_path << std::endl;
}

// NeuralIDEComponentManager Implementation
NeuralIDEComponentManager::NeuralIDEComponentManager() {
    // Register default components
    register_component(std::make_shared<NeuralIDEToolbar>());
    register_component(std::make_shared<NeuralIDESettingsDialog>());
    register_component(std::make_shared<NeuralIDEFileExplorer>());
    register_component(std::make_shared<NeuralIDECodeEditor>());
    register_component(std::make_shared<NeuralIDEOutputPanel>());
}

NeuralIDEComponentManager::~NeuralIDEComponentManager() {
    components_.clear();
}

void NeuralIDEComponentManager::register_component(std::shared_ptr<NeuralIDEComponent> component) {
    std::lock_guard<std::mutex> lock(components_mutex_);
    components_[component->get_component_id()] = component;
}

void NeuralIDEComponentManager::unregister_component(const std::string& component_id) {
    std::lock_guard<std::mutex> lock(components_mutex_);
    components_.erase(component_id);
}

std::shared_ptr<NeuralIDEComponent> NeuralIDEComponentManager::get_component(const std::string& component_id) {
    std::lock_guard<std::mutex> lock(components_mutex_);
    auto it = components_.find(component_id);
    return (it != components_.end()) ? it->second : nullptr;
}

void NeuralIDEComponentManager::render_all() {
    std::lock_guard<std::mutex> lock(components_mutex_);
    for (const auto& [id, component] : components_) {
        component->render();
    }
}

void NeuralIDEComponentManager::update_all() {
    std::lock_guard<std::mutex> lock(components_mutex_);
    for (const auto& [id, component] : components_) {
        component->update();
    }
}

void NeuralIDEComponentManager::handle_input_all(const std::string& input) {
    std::lock_guard<std::mutex> lock(components_mutex_);
    for (const auto& [id, component] : components_) {
        component->handle_input(input);
    }
}

void NeuralIDEComponentManager::set_all_visible(bool visible) {
    std::lock_guard<std::mutex> lock(components_mutex_);
    for (const auto& [id, component] : components_) {
        component->set_visible(visible);
    }
}

std::vector<std::string> NeuralIDEComponentManager::get_component_ids() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(components_mutex_));
    std::vector<std::string> ids;
    for (const auto& [id, _] : components_) {
        ids.push_back(id);
    }
    return ids;
}

std::vector<std::shared_ptr<NeuralIDEComponent>> NeuralIDEComponentManager::get_all_components() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(components_mutex_));
    std::vector<std::shared_ptr<NeuralIDEComponent>> all_components;
    for (const auto& [id, component] : components_) {
        all_components.push_back(component);
    }
    return all_components;
}

size_t NeuralIDEComponentManager::get_component_count() const {
    std::lock_guard<std::mutex> lock(const_cast<std::mutex&>(components_mutex_));
    return components_.size();
}

} // namespace vectoros_v2