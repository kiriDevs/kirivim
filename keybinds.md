# kiriVim Keybinds

This is an exhaustive list of all custom keybinds contained in this config
(unless I forgot to update this list at some point).

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
