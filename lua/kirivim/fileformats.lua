local create_filetype = function(patterns, filetype, side_effect)
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = patterns,
        callback = function()
            vim.opt.filetype = filetype
            local se_type = type(side_effect)
            if se_type == "function" then
                side_effect()
            else
                print(
                    "kirivim:fileformats: " .. filetype .. ": "
                    .. "Invalid type(side_effect) = " .. se_type
                )
            end
        end
    })
end

create_filetype({ "*.typ" }, "typst")
create_filetype({ "bun.lock" }, "json5")
create_filetype({ "*.hypr" }, "hyprlang", function()
    vim.opt.wrap = false
end)
create_filetype({ "*.nix" }, "nix", function()
    vim.opt.wrap = false
    vim.opt.shiftwidth = 2
end)
