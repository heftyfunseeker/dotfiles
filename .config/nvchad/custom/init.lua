-- This is where you custom modules and plugins goes.
-- See the wiki for a guide on how to extend NvChad
local map = require("core.utils").map
-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--
vim.o.guifont = "MonoLisa Nerd Font Mono:h16"
vim.o.listchars="tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○"
vim.o.list=true

-- neovide config
vim.g.neovide_cursor_vfx_mode="ripple"

map("n", "<leader>s", ":Narrow <CR>")
map("n", "<leader>sw", ":Telescope grep_string <CR>")
map("n", "<leader>nv", ':lua require("custom.utils").findNvimFile() <CR>')
map("n", "<leader>l", ':lua require("telescope.builtin").current_buffer_fuzzy_find() <CR>')
map("n", "<leader>q", ':lua require("telescope.builtin").quickfix() <CR>')
map("n", "<leader>f", ':lua vim.lsp.buf.formatting() <CR>')
map("n", "<leader>g", ':Neogit <CR>')

map("v", "y", "ygv <Esc>")

-- Github Browsing shortcut
function git_browse()
   local filename = vim.fn.expand('%')
   local line_number = vim.api.nvim_win_get_cursor(0)[1]
   local command = "!gh browse " .. filename .. ":" .. tostring(line_number)
   vim.cmd(command)
end
map("n", "<leader>gb", ':lua git_browse() <CR>')

-- hightlighted yank
vim.cmd([[ au TextYankPost * silent! lua vim.highlight.on_yank() ]])

-- custom highlights
vim.cmd("hi Comment gui=italic")
vim.cmd("hi Keyword gui=italic")
vim.cmd("hi Macro   gui=italic")

