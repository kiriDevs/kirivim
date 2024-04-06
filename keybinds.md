# kiriVim Keybinds

This file documents *all* changes kiriVim applies to `nvim`s default keymap
(unless I forgot to update it at some point).


- [Added Keybinds](#added-keybinds)
- [Removed / NoOp-Overridden Keybinds](#removed---noop-overridden-keybinds)

## Added Keybinds

While kiriVim aims to keep the keymap close to default, it does add keybinds
for many plugin actions, and a couple things I personally think are convenient.

mode     | bind         | result
-------- | ------------ | ----------------------------------------------------
normal   | `<leader>x`  | `:Ex` (opens `netrw` explorer)
normal   | `<leader>q`  | `:q` (closes the current buffer)
normal   | `<leader>H`  | `:nohlsearch` (stops highlighting search results)
normal   | `<leader>t`  | `:term` (opens a terminal buffer)
normal   | `<leader>u`  | `:UndotreeToggle` (Toggles an undotree pane)
normal   | `<leader>sf` | Opens Telescope to *s*earch for *f*iles
normal   | `<leader>ss` | Opens Telescope's live-grep menu
normal   | `<leader>sb` | Opens Telescope to *s*earch through *b*uffers
normal   | `<leader>sh` | Opens Telescope to *s*earch through *h*elp
cmp      | `<C-k>`      | Selects previous completion item
cmp      | `<C-j>`      | Selects next completion item
cmp      | `<C-l>`      | Confirms selectied completion item
terminal | `<Esc>`      | `<C-\><C-n>` (exits TERMINAL mode)
terminal | `<C-^>`      | Sends `<Esc>` to the terminal

> [!IMPORTANT]
> Added keybinds can, obviously, imply that other keybinds have been "removed"
> by overriding.

## Removed / NoOp-Overridden Keybinds

These are all keybinds kiriVim either removes (`vim.keymap.del`), or overrides
with a no-op (`function() end`) if they are built-in. The reason for this
generally is that I, personally, find them to be annoying, i.e. because of
common (or very "annoying to fix") accidental triggers.

mode   | bind | reason
------ | ---- | ---------------------------------------------------------------
normal | `.`  | `de` keyboard: `:` = `shift` + `.`; I mistime `shift` sometimes
