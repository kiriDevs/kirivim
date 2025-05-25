local linter_config = {
    kotlin = { "ktlint" },
}

return {
    {
        "mfussenegger/nvim-lint",
        config = function()
            local missing_linters = {}
            for _, linters in pairs(linter_config) do
                for _, linter in ipairs(linters) do
                    if vim.fn.executable(linter) == 0 then -- not executable
                        table.insert(missing_linters, linter)
                    end
                end
            end
            local install_string = table.concat(missing_linters, " ")
            if install_string ~= "" then
                vim.cmd.MasonInstall(install_string)
            end

            local lint = require("lint")
            lint.linters_by_ft = linter_config
            vim.api.nvim_create_autocmd(
                { "InsertLeave", "TextChanged" },
                { callback = function() lint.try_lint() end }
            )
        end,
        dependencies = {
            { "williamboman/mason.nvim", config = true },
        }
    },
}
