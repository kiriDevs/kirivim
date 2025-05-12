# kiriVim Keybinds

This file documents *all* changes kiriVim applies to `nvim`s default keymap
(unless I forgot to update it at some point).


- [Added Keybinds](#added-keybinds)
- [Removed / NoOp-Overridden Keybinds](#removed---noop-overridden-keybinds)

## Added Keybinds

While kiriVim aims to keep the keymap close to default, it does add keybinds
for many plugin actions, and a couple things I personally think are convenient.

> [!TIP]
> kiriVim's default `<leader>` key is ` ` (space).

mode     | bind              | result
-------- | ----------------- | ----------------------------------------------------
normal   | `<leader>x`       | `:Ex` (opens `netrw` explorer)
normal   | `<leader>q`       | `:q` (closes the current buffer)
normal   | `<leader>Q`       | `:bdelete` (deletes the current buffer)
normal   | `<leader>H`       | `:nohlsearch` (stops highlighting search results)
normal   | `<leader>t`       | `:term` (opens a terminal buffer)
normal   | `<leader>u`       | `:UndotreeToggle` (Toggles an undotree pane)
normal   | `<leader><Tab>u`  | Jump to existing undotree pane
normal   | `<leader>sf`      | Opens Telescope to *s*earch for *f*iles
normal   | `<leader>ss`      | Opens Telescope's live-grep menu
normal   | `<leader>sb`      | Opens Telescope to *s*earch through *b*uffers
normal   | `<leader>sh`      | Opens Telescope to *s*earch through *h*elp
normal   | `<leader>c+`      | Enable GitHub Copilot
normal   | `<leader>c-`      | Disable GitHub Copilot
normal   | `<leader>cs`      | Print GitHub Copilot status
normal   | `<leader>c!`      | Re-Setup GitHub Copilot
insert   | `<C-Return>`      | Accept GitHub Copilot suggestion
cmp      | `<C-k>`           | Selects previous completion item
cmp      | `<C-j>`           | Selects next completion item
cmp      | `<C-l>`           | Confirms selectied completion item
terminal | `<Esc>`           | `<C-\><C-n>` (exits TERMINAL mode)
terminal | `<C-^>`           | Sends `<Esc>` to the terminal

## Removed / NoOp-Overridden Keybinds

These are all keybinds kiriVim either removes (`vim.keymap.del`), or overrides
with a no-op (`function() end`) if they are built-in. The reason for this
generally is that I, personally, find them to be annoying, i.e. because of
common (or very "annoying to recover from") accidental triggers.

> [!IMPORTANT]
> Added keybinds can imply that other keybinds have been overriden, resulting
> in effective removal without being listed here.

mode   | bind | reason
------ | ---- | ---------------------------------------------------------------
normal | `.`  | `:` is shift+`.` on `de` keyboards, so I trigger `.` by accident
