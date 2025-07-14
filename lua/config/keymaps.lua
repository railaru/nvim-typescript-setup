-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- shift + f = open telescope to find files
vim.api.nvim_set_keymap("n", "<S-f>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })

-- ctrl + s = save file, same as w + q
vim.api.nvim_set_keymap("n", "<D-s>", ":w<CR>", { noremap = true, silent = true })

-- shift + t = open trouble view for errors and warnings
vim.api.nvim_set_keymap("n", "<S-t>", "<cmd>Trouble<CR>", { noremap = true, silent = true })
-- shift + c = close trouble view
vim.api.nvim_set_keymap("n", "<S-c>", "<cmd>TroubleClose<CR>", { noremap = true, silent = true })

-- shift + k = hover over a symbol to see the type definition
vim.api.nvim_set_keymap('n', '<S-K>', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- TypeScript auto-import keymaps
vim.api.nvim_set_keymap('n', '<leader>ci', '<cmd>lua vim.lsp.buf.code_action({filter = function(action) return action.kind and action.kind:match("source%.addMissingImports") end, apply = true})<CR>', { noremap = true, silent = true, desc = "Add missing imports" })
vim.api.nvim_set_keymap('n', '<leader>co', '<cmd>lua vim.lsp.buf.code_action({filter = function(action) return action.kind and action.kind:match("source%.organizeImports") end, apply = true})<CR>', { noremap = true, silent = true, desc = "Organize imports" })

-- Theme switching keymaps
local theme_manager = require("config.theme-manager")

-- <leader>tt = toggle between dark/light mode
vim.keymap.set("n", "<leader>tt", theme_manager.toggle_theme_mode, { desc = "Toggle dark/light theme" })

-- <leader>tc = cycle through themes in current mode
vim.keymap.set("n", "<leader>tc", theme_manager.cycle_theme, { desc = "Cycle themes" })

-- <leader>tp = open theme picker
vim.keymap.set("n", "<leader>tp", theme_manager.show_theme_picker, { desc = "Pick theme" })

-- <leader>ts = sync with system theme
vim.keymap.set("n", "<leader>ts", theme_manager.sync_with_system, { desc = "Sync with system theme" })
