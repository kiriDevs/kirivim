local function reap_buffers()
    local active_bufs = {}
    for _, tab in pairs(vim.api.nvim_list_tabpages()) do
        for _, win in pairs(vim.api.nvim_tabpage_list_wins(tab)) do
            active_bufs[vim.api.nvim_win_get_buf(win)] = true;
        end
    end

    local dels_attempted = 0;
    local dels_succeeded = 0;
    for _, buf in pairs(vim.api.nvim_list_bufs()) do
        if not active_bufs[buf] == true then
            dels_attempted = dels_attempted + 1;
            local success = pcall(vim.api.nvim_buf_delete, buf, {});
            if success then dels_succeeded = dels_succeeded + 1; end
        end
    end

    print(
        "Attempted to kill " .. dels_attempted .. " buffers: "
        .. dels_succeeded .. " were deleted, "
        .. dels_attempted - dels_succeeded .. " were spared."
    );
end
for _, alias in ipairs({ "BufReap", "ReapBufs" }) do vim.api.nvim_create_user_command(alias, reap_buffers, {}); end;
