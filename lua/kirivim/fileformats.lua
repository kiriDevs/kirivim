vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.typ" },
    callback = function()
        vim.opt.filetype = "typst"
    end
})
