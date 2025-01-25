vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.typ" },
    callback = function()
        vim.opt.filetype = "typst"
    end
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "bun.lock" },
    callback = function ()
        vim.opt.filetype = "jsonc" -- Not ideal (trailing commas), close enough
    end
})
