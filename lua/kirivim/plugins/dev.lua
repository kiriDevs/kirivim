if not vim.env.VIM_DEV then return {};
else print("kirivim: --- DEV MODE ---"); return {
    {
        "kiriDevs/signcolumn.nvim",
        name = "signcolumn.nvim",
        dev = true,
    }
}; end;
