-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

-- shift + f = open telescope to find files
vim.api.nvim_set_keymap("n", "<S-f>", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
-- ctrl + s = save file, same as w + q
vim.api.nvim_set_keymap("n", "<D-s>", ":w<CR>", { noremap = true, silent = true })
