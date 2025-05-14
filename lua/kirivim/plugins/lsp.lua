-- Language Servers to always install
local install_servers = {
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
    nil_ls = "nix",
    tinymist = "typst",
    texlab = "latex",
    kotlin_language_server = { "kotlin" },
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
    else table.insert(install_servers, subject) end
end
for server_name, dependencies in pairs(dependant_servers) do
    if dependencies_met(dependencies) then request_installation(server_name) end
end

local customLsConfigs = {
    lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        settings = { Lua = {
            ["diagnostics.globals"] = { "vim" },
        }},
    },
    rust_analyzer = {
        cmd = { "rust-analyzer" },
        settings = { rust_analyzer = {
            ["check.command"] = "clippy",
        }},
    }
    -- TODO: gdscript?
}

return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        {
            "neovim/nvim-lspconfig",
            {
                "williamboman/mason.nvim",
                config = function() require("mason").setup({}) end
            },
        },
    },
    config = function()
        local preSetupLs = {}
        for lsname, lsconfig in pairs(customLsConfigs) do
            vim.lsp.config(lsname, lsconfig)
            if lsname ~= "*" then
                vim.lsp.enable(lsname)
                table.insert(preSetupLs, lsname)
            end
        end
        require("mason-lspconfig").setup {
            ensure_installed = install_servers,
            automatic_enable = { exclude = preSetupLs }
        }

        vim.api.nvim_create_autocmd({ "LspAttach" }, {
            callback = function ()
                vim.opt.signcolumn = "yes:3" -- Wide signcolumn for LSP errors
            end
        })
    end,
    opts = function()

        vim.diagnostic.config({
            virtual_lines = { current_line = true }
        })
    end,
}
