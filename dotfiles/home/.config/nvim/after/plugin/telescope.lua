-- Enhanced Telescope setup with TJ DeVries' improvements
local builtin = require('telescope.builtin')

-- File finding
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find all files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })

-- Search functionality
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = 'Telescope grep with input' })

vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })

-- LSP integration
vim.keymap.set('n', '<leader>pr', builtin.lsp_references, { desc = 'Telescope LSP references' })
vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = 'Telescope diagnostics' })

-- Useful utilities
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = 'Telescope keymaps' })
