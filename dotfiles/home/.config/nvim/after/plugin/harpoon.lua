-- Harpoon v2 setup based on TJ DeVries' configuration
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- Add current file to harpoon list
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add file to harpoon" })

-- Toggle harpoon quick menu
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle harpoon menu" })

-- Navigate to specific files (using space + number like TJ)
for _, idx in ipairs { 1, 2, 3, 4, 5 } do
  vim.keymap.set("n", string.format("<space>%d", idx), function()
    harpoon:list():select(idx)
  end, { desc = string.format("Harpoon file %d", idx) })
end

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon next" })
