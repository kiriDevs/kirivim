vim.g.mapleader = " "

vim.keymap.set("n", "<leader>x", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.cmd.quit)

vim.keymap.set("n", "<leader>H", vim.cmd.nohlsearch)

vim.keymap.set("n", "<leader>t", vim.cmd.term)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-^>", "<Esc>") -- Be able to send ESC for interactivity
