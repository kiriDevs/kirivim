-- Language Servers to always install
local install_list = {
    "lua_ls", "bashls",
    "html", "ts_ls" --[[ TypeScript ]],
    "jsonls", "taplo" --[[ TOML ]], "yamlls",
}

-- Language Servers to install based on availability of one or more binaries
-- Maps server name to dependencies (PATH binaries)
local dependant_servers = {
    jdtls = "java",
    pylsp = "python",
    rust_analyzer = { "rustc", "cargo" },
    ["nil_ls"] = "nix",
    tinymist = "typst",
    texlab = "latex",
}

-- Add applicable dependant servers to install_list
local function dependencies_met(dep)
    if type(dep) == "table" then
        for _, entry in pairs(dep) do
            if not dependencies_met(entry) then return false end
        end
        return true
    else return vim.fn.executable(dep) == 1 end
end
local function request_installation(subject)
    if type(subject) == "table" then
        for _, entry in pairs(subject) do request_installation(entry) end
    else table.insert(install_list, subject) end
end
for server_name, dependencies in pairs(dependant_servers) do
    if dependencies_met(dependencies) then request_installation(server_name) end
end

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
                    ensure_installed = install_list,
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
    end,
    opts = function()
        vim.opt.signcolumn = "yes:3" -- Wide signcolumn for LSP errors
    end,
}
