vim.g.mapleader = " "

vim.keymap.set("n", "<leader>x", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.cmd.quit)
vim.keymap.set("n", "<leader>Q", vim.cmd.bdelete)

vim.keymap.set("n", "<leader>H", vim.cmd.nohlsearch)

vim.keymap.set("n", "<leader>t", vim.cmd.term)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-^>", "<Esc>") -- Be able to send ESC for interactivity

-- TOOD: Restrict this to Markdown buffers (→ autocmd)
vim.keymap.set("n", "<leader>g", vim.cmd.Glow)

-- Unbind / Override undesired default binds
local nop = function() end
vim.keymap.set("n", ".", nop)
