return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vimdoc", "comment", "lua", "bash", "diff" ,
                "html", "css", "javascript", "typescript", "tsx",
                "java", "rust", "python",
                "json", "toml", "yaml",
                "latex", "typst",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            }
        })
        vim.cmd.TSUpdate()
    end
}
