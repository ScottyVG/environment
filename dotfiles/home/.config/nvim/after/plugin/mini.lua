-- Mini.nvim setup for enhanced text operations
-- Based on TJ DeVries' configuration

-- Enhanced text objects (around/inside)
require("mini.ai").setup()

-- Surround operations (add, delete, replace surroundings)
require("mini.surround").setup()

-- Optional: Add more mini modules as needed
-- require("mini.comment").setup() -- Smart commenting
-- require("mini.pairs").setup()   -- Auto pairs