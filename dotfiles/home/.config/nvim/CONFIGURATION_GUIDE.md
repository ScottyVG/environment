# Neovim Configuration Guide

## Overview
This configuration combines the best practices from TJ DeVries (Neovim core team member) with personal preferences for development workflow.

## Current Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Entry point - loads scottyvg module
├── lua/scottyvg/
│   ├── init.lua               # Loads all modules
│   ├── packer.lua             # Plugin management with Packer
│   ├── set.lua                # Vim options and settings
│   └── remap.lua              # Key mappings
└── after/plugin/              # Plugin configurations
    ├── colors.lua             # Colorscheme setup
    ├── fugitive.lua           # Git integration
    ├── harpoon.lua            # File navigation
    ├── lsp.lua                # Language Server Protocol
    ├── telescope.lua          # Fuzzy finder
    ├── treesitter.lua         # Syntax highlighting
    └── undotree.lua           # Undo history

```

## Key Features

### Core Settings (`set.lua`)
- **Line Numbers**: Both absolute and relative for easy navigation
- **Indentation**: 4 spaces, smart indenting
- **Search**: Incremental search, case-smart matching
- **Undo**: Persistent undo history stored in `~/.vim/undodir`
- **Visual**: 80-character column guide, sign column always visible

### Key Mappings (`remap.lua`)
- **Leader Key**: `<Space>`
- **File Explorer**: `<leader>pv` opens netrw
- **Movement**: Enhanced with centering (Ctrl-d/u, n/N)
- **System Clipboard**: `<leader>y` copies to system clipboard
- **Window Navigation**: Ctrl+hjkl for split navigation
- **Quick Replace**: `<leader>s` for word replacement

### Plugin Ecosystem

#### Core Plugins
- **Telescope**: Fuzzy finder for files, grep, and more
- **Treesitter**: Advanced syntax highlighting and text objects
- **LSP-Zero**: Simplified Language Server Protocol setup
- **Harpoon**: Quick file navigation (currently commented out)
- **Fugitive**: Git integration
- **Undotree**: Visual undo history

#### Language Support
- **TypeScript/JavaScript**: ts_ls
- **Python**: basedpyright
- **Go**: gopls
- **Terraform**: tflint
- **Markdown**: marksman

## Development Workflow

### File Navigation
1. **Telescope** (`<leader>ff`) - Find files by name
2. **Telescope Grep** (`<leader>fg`) - Search file contents
3. **File Explorer** (`<leader>pv`) - Browse directory structure

### Code Navigation
1. **LSP Goto Definition** (`gd`) - Jump to definition
2. **LSP References** (`gr`) - Find all references
3. **LSP Hover** (`K`) - Show documentation
4. **Diagnostic Navigation** (`]d`, `[d`) - Navigate errors/warnings

### Code Editing
1. **Format Code** (`<leader>f`) - Format current buffer
2. **Rename Symbol** (`F2`) - Rename variable/function
3. **Code Actions** (`F4`) - Show available code actions
4. **Visual Block Move** (`J`/`K` in visual mode) - Move lines up/down

### Git Integration
1. **Git Status** (`:Git`) - Fugitive git interface
2. **Git Blame** (`:Git blame`) - Show line-by-line blame
3. **Git Diff** (`:Gdiffsplit`) - Split diff view

## Useful Features from TJ DeVries' Config

### Enhanced LSP Setup
- **Mason**: Automatic LSP server installation and management
- **Conform.nvim**: Better autoformatting with multiple formatters
- **Fidget.nvim**: LSP progress indicators
- **More Language Servers**: Comprehensive language support

### Better File Management
- **Oil.nvim**: Edit directories like buffers (better than netrw)
- **Enhanced Harpoon v2**: Improved file marking and navigation

### Quality of Life Improvements
- **Mini.nvim**: Text objects and surround operations
- **Better Search**: `inccommand = "split"` for live substitution preview
- **Smart Keymaps**: Context-aware navigation and editing

### Advanced Features
- **Schema Validation**: JSON/YAML schema support
- **Inlay Hints**: Type hints for supported languages
- **Better Diagnostics**: Enhanced error/warning display

## Configuration Philosophy

### TJ's Approach
- Minimal but powerful
- Focus on built-in Neovim features
- Lazy loading for performance
- Comprehensive LSP setup
- Development-focused keymaps

### Current Setup
- Beginner-friendly with Packer
- Essential plugins for development
- Clear separation of concerns
- Documented for learning

## Future Enhancements

### Recommended Integrations
1. **Migrate to Lazy.nvim** for better performance
2. **Add Mason** for automatic LSP management
3. **Integrate Oil.nvim** for better file management
4. **Add Conform.nvim** for consistent formatting
5. **Include Mini.nvim** for enhanced text operations

### Development Workflow Improvements
1. **Better Git Integration** with more fugitive features
2. **Enhanced Debugging** with nvim-dap
3. **Project Management** with better session handling
4. **Testing Integration** for various languages

## Troubleshooting

### Common Issues
1. **LSP Not Working**: Check if language server is installed
2. **Telescope Errors**: Ensure ripgrep is installed
3. **Treesitter Issues**: Run `:TSUpdate` to update parsers
4. **Plugin Errors**: Run `:PackerSync` to update plugins

### Performance Tips
1. Use lazy loading for plugins
2. Minimize startup plugins
3. Profile with `:profile start profile.log`
4. Check health with `:checkhealth`

## Learning Resources
- **Neovim Documentation**: `:help` command
- **TJ DeVries YouTube**: Neovim tutorials and tips
- **ThePrimeagen**: Vim/Neovim workflow videos
- **Neovim Discourse**: Community discussions and help