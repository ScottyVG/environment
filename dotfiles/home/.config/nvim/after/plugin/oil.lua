-- Oil.nvim setup for better file management
-- Based on TJ DeVries' configuration

require("oil").setup({
  columns = { "icon" },
  keymaps = {
    ["<C-h>"] = false, -- disable to avoid conflicts
    ["<M-h>"] = "actions.select_split",
  },
  view_options = {
    show_hidden = true,
  },
  -- Skip the confirmation popup for simple operations
  skip_confirm_for_simple_edits = true,
})

-- Open parent directory in current window
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Open parent directory in floating window  
vim.keymap.set("n", "<space>-", require("oil").toggle_float, { desc = "Open parent directory (float)" })