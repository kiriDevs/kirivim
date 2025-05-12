# kiriVim

This is current Neovim configuration, written in lua, using lazy.nvim.

> [!NOTE]
> This is my first configuration written in Lua; you might notice this in code
> quality / style.

## Key Points

- **Package Manager:** [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- **Colorscheme:** [`tokyonight` (Storm)](https://github.com/folke/tokyonight.nvim)
- Syntax Highlighting with [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- LSP support with [`mason-lspsetup`](https://github.com/williamboman/mason-lspconfig.nvim)
- Automatic Code Completion
  - LSP servers via [`nvim-cmp`](https://github.com/hrsh7th/nvim-cmp)
  - GitHub Copilot via [`copilot.vim`](https://github.com/github/copilot.vim)
- Minimal keybinds ([full list](/keybinds.md))

*more [below](#also-included)*

## Dependencies

- [`ripgrep`](https://github.com/BurntSushi/ripgrep) for Telescope's live grep
- [`tree-sitter` CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md)
  for some parsers kiriVim loads by default

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

While a bunch of things have changed in the meantime, the original form of this
configuration was heavily based on
[@ThePrimeagen's configuration as of commit `f715b0`](https://github.com/ThePrimeagen/neovimrc/tree/f715b041310f89b11e68884c605b2b5d7a3f162b).
