# kiriVim

This is current Neovim configuration, written in lua, using lazy.nvim.

**Note:** This is my first configuration written in Lua; you might notice this
in code quality / style.

## Key Points

- **Package Manager:** [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- **Colorscheme:** [`tokyonight` (Storm)](https://github.com/folke/tokyonight.nvim)
- Syntax Highlighting with [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- LSP support with [`mason-lspsetup`](https://github.com/williamboman/mason-lspconfig.nvim)
- Code Completion (including LSP) with [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp)
- Minimal keybinds ([full list](/keybinds.md))

*more [below](#also-included)*

## Notes

Things that might become important when you try this for yourself:

- `lazy.nvim` will be installed automatically if `git` is available
- The `<leader>` key is set to ` ` (space) by default
- Mouse features are disabled; see `/lua/kirivim/options.lua` if you want them.
- `fileformat` (line endings) is set to `unix` (`LF`); consider this if you're on Windows

## Also included

These things are also really nice, just not quite noteworthy enough to make it
to the [key points](#key-points).

- Fuzzy Finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [`gitsigns.nvim`](https://github.com/lewis6991/gitsigns.nvim)
- [`undotree`](https://github.com/mbbill/undotree)

## Thanks

This configuration is heavily based on the setup(s) shown by ThePrimeagen in
[his "0 to LSP" video](https://youtu.be/watch?v=w7i4amO_zaE), as well as
[his current configuration on GitHub](https://github.com/ThePrimeagen/neovimrc).
