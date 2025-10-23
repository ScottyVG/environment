-- Mason setup for automatic LSP server management
-- Based on TJ DeVries' configuration

require("mason").setup()

-- Ensure these tools are installed
local ensure_installed = {
  "stylua", -- Lua formatter
  "lua_ls", -- Lua language server
  "gopls", -- Go language server
  "ts_ls", -- TypeScript language server
  "basedpyright", -- Python language server
  "marksman", -- Markdown language server
  "tflint", -- Terraform linter
}

require("mason-tool-installer").setup({ 
  ensure_installed = ensure_installed,
  auto_update = false,
  run_on_start = true,
})

-- Mason-lspconfig integration
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "gopls", 
    "ts_ls",
    "basedpyright",
    "marksman",
  },
  automatic_installation = true,
})