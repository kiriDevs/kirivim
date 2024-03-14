return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
	local telescope = require("telescope.builtin")
	vim.keymap.set("n", "<leader>sf", telescope.find_files)
	vim.keymap.set("n", "<leader>ss", telescope.live_grep)
	vim.keymap.set("n", "<leader>sb", telescope.buffers)
	vim.keymap.set("n", "<leader>sh", telescope.help_tags)
    end
}
