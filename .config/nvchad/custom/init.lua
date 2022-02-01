-- This is where you custom modules and plugins goes.
-- See the wiki for a guide on how to extend NvChad

local customPlugins = require "core.customPlugins"
local map = require("core.utils").map
-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:
--
vim.o.guifont = "MonoLisa Nerd Font Mono:h16"
vim.o.listchars="tab:▷ ,trail:·,extends:◣,precedes:◢,nbsp:○"
vim.o.list=true

-- neovide config
vim.g.neovide_cursor_vfx_mode="ripple"

-- " Navigate quickfix list with ease
-- nnoremap <silent> [q :cprevious<CR>
-- nnoremap <silent> ]q :cnext<CR>

map("n", "<leader>s", ":Narrow <CR>")
map("n", "<leader>sw", ":Telescope grep_string <CR>")
map("n", "<leader>nv", ':lua require("custom.utils").findNvimFile() <CR>')
map("n", "<leader>l", ':lua require("telescope.builtin").current_buffer_fuzzy_find() <CR>')
map("n", "<leader>q", ':lua require("telescope.builtin").quickfix() <CR>')
map("n", "<leader>f", ':lua vim.lsp.buf.formatting() <CR>')

map("v", "y", "ygv <Esc>")

-- Github Browsing shortcut
function git_browse()
   filename = vim.fn.expand('%')
   line_number = vim.api.nvim_win_get_cursor(0)[1]
   command = "!gh browse " .. filename .. ":" .. tostring(line_number)
   vim.cmd(command)
end
map("n", "<leader>gb", ':lua git_browse() <CR>')

-- hightlighted yank
vim.cmd([[ au TextYankPost * silent! lua vim.highlight.on_yank() ]])

-- custom highlights
vim.cmd("hi Comment gui=italic")
vim.cmd("hi Keyword gui=italic")
vim.cmd("hi Macro   gui=italic")

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

customPlugins.add(function(use)
   use {
      "editorconfig/editorconfig-vim",
   }
   use {
      "stefandtw/quickfix-reflector.vim",
   }
   use {
      "AndrewRadev/splitjoin.vim"
   }
   use {
      "ggandor/lightspeed.nvim"
   }
   use {
      "tpope/vim-surround"
   }
   use {
      "tpope/vim-obsession"
   }
   use {
      "tpope/vim-fugitive"
   }
   use {
      'heftyfunseeker/narrow'
   }
   use {
      'j-hui/fidget.nvim',
       config = function()
         require('fidget').setup({})
      end
   }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
