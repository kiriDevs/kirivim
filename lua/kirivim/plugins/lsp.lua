return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                {
                    "williamboman/mason.nvim",
                    config = function()
                        require("mason").setup({})
                    end
                }
            },
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = {
                        "lua_ls", "bashls",
                        "html", "tsserver",
                        "jdtls", "rust_analyzer", "pylsp",
                        "jsonls", "taplo", "yamlls",
                    }
                })
            end
        },
        {
            "hrsh7th/cmp-nvim-lsp",
            dependencies = { "hrsh7th/nvim-cmp" },
        }
    },
    config = function()
        local cmpCapabilities = require("cmp_nvim_lsp").default_capabilities()

        local lsp = require("lspconfig")
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                lsp[server_name].setup({
                    capabilities = cmpCapabilities
                })
            end,

            ["lua_ls"] = function()
                lsp.lua_ls.setup({
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                })
            end,

            ["rust_analyzer"] = function()
                lsp["rust_analyzer"].setup({
                    settings = {
                        ["rust-analyzer"] = {
                            check = {
                                command = "clippy"
                            }
                        }
                    }
                })
            end
        })

        vim.opt.signcolumn = "yes:3" -- Wide signcolumn for LSP errors
    end
}
