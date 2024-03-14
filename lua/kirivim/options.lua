-- Visual Options
vim.opt.number = true
vim.opt.numberwidth = 6
vim.opt.colorcolumn = { 80, 120 }
vim.opt.cursorline = true;

-- Navigation Options
vim.opt.mouse = {}

-- Formatting Options
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.fileformat = "unix"

-- Disable external providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
