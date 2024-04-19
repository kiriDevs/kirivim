local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Missing lazy.nvim; Installing...")
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "folke/lazy.nvim" },
    { import = "kirivim.plugins.colorschemes" },

    { import = "kirivim.plugins.treesitter" },
    { import = "kirivim.plugins.lsp" },
    { import = "kirivim.plugins.completion" },
    { import = "kirivim.plugins.telescope" },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
            vim.opt.signcolumn = "yes:1" -- Prevent bouncing on first gitsign
        end
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },
    { "ellisonleao/glow.nvim", config = true, cmd = "Glow" }
})
