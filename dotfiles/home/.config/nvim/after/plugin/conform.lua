-- Conform.nvim setup for better formatting
-- Based on TJ DeVries' configuration

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    go = { "gofmt" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Manual format keymap (already exists in remap.lua as <leader>f)
vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({ 
    bufnr = vim.api.nvim_get_current_buf(),
    lsp_fallback = true,
  })
end, { desc = "Format current buffer" })