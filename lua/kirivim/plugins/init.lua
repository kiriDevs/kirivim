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
    { import = "kirivim.plugins.dev" },
    { import = "kirivim.plugins.colorschemes" },

    { import = "kirivim.plugins.treesitter" },
    { import = "kirivim.plugins.lsp" },
    { import = "kirivim.plugins.completion" },
    { import = "kirivim.plugins.linting" },
    { import = "kirivim.plugins.syntax" },
    { import = "kirivim.plugins.telescope" },

    {
        "lewis6991/gitsigns.nvim",
        opts = { signcolumn = false; numhl = true; }
    },
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
            vim.keymap.set('n', '<leader><Tab>u', function ()
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local buf = vim.api.nvim_win_get_buf(win)
                    local bufname = vim.api.nvim_buf_get_name(buf)
                    if string.match(bufname, "undotree") then
                        vim.api.nvim_set_current_win(win)
                        break
                    end
                end
            end)
        end
    },
    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow",
        keys = { { "<leader>g", vim.cmd.Glow } }
    },
    {
        "IogaMaster/neocord",
        keys = {
            { "<leader>ds", function() require("neocord").setup() end }
        }
    },
}, {
    dev = { path = "~/src/kiriDevs/", },
})
