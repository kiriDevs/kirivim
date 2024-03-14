local CS_PRIORITY = 99

return {
    -- Make sure main color scheme is loaded first (priority=)
    -- And use the config= property to set it right after loading
    {
        "folke/tokyonight.nvim",
        priority = CS_PRIORITY,
        config = function()
            require("tokyonight").setup({
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                },
                day_brightness = 0.4,
            })
            vim.cmd.colorscheme("tokyonight-storm")
        end
    },
    { "catppuccin/nvim", name = "catppuccin", lazy = true },
}
