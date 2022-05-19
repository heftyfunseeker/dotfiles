-- maps.lua

local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

local options = { noremap = true, silent = true }
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader>n', ':bnext<cr>', options)
map('n', '<leader>p', ':bprev<cr>', options)

-- nvim tree
map('n', '<C-n>', ':NvimTreeToggle<cr>', options)

-- window switching
map('n', '<C-h>', '<C-w>h', options)
map('n', '<C-j>', '<C-w>j', options)
map('n', '<C-k>', '<C-w>k', options)
map('n', '<C-l>', '<C-w>l', options)

-- telescope
map('n', '<leader>ff', ':Telescope find_files<cr>', options)
map('n', '<leader>fb', ':Telescope buffers<cr>', options)

-- narrow
map('n', '<leader>s', ':Narrow<cr>', options)

-- (toggle) terminal
map('n', '<leader>t', ':ToggleTerm<cr>', options)
map('t', '<esc>', [[<C-\><C-n>]], options)

-- lsp config
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', options)
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', options)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', options)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', options)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', options)
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', options)
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', options)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', options)
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', options)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', options)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', options)
