return {
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_no_tab_map = true -- Do not bind to <Tab>
            vim.cmd.Copilot("setup")
        end,
        cmd = "Copilot",
        keys = {
            { "<leader>c+", function() vim.cmd.Copilot("enable") end },
            { "<leader>c-", function() vim.cmd.Copilot("disable") end },
            { "<leader>cs", function() vim.cmd.Copilot("status") end },
            { "<leader>c!", function() vim.cmd.Copilot("setup") end },
            {
                "<C-Return>", "copilot#Accept('')", expr = true, mode = "i",
                replace_keycodes = false -- Prevents weird trailing characters
            },
        }
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            {
                "saadparwaiz1/cmp_luasnip",
                dependencies = {
                    "L3MON4D3/LuaSnip"
                }
            }
        },
        config = function()
            local cmp = require("cmp")
            local cmpSelect = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" }
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(cmpSelect),
                    ["<C-j>"] = cmp.mapping.select_next_item(cmpSelect),
                    ["<C-l>"] = cmp.mapping.confirm({ select = true })
                })
            })

            cmp.setup.filetype("markdown", {
                sources = {
                    { name = "buffer" }
                }
            })
        end
    }
}
