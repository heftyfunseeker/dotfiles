-- maps.lua

local map = vim.api.nvim_set_keymap

-- map the leader key
map("n", "<Space>", "", {})
vim.g.mapleader = " " -- 'vim.g' sets global variables

local options = { noremap = true, silent = true }
map("n", "<esc>", ":nohlsearch<CR>", options)
map("n", "<leader>n", ":bnext<CR>", options)
map("n", "<leader>p", ":bprev<CR>", options)

-- nvim tree
map("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", options)

-- window switching
map("n", "<C-h>", "<C-w>h", options)
map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)

-- telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", options)
map("n", "<leader>fb", ":Telescope buffers<CR>", options)
map("n", "<leader>sw", ":Telescope live_grep<CR>", options)

-- narrow
map('n', '<leader>s', ":lua require('narrow').search_project()<CR>", options)
map('n', '<leader>l', ":lua require('narrow').search_current_file()<CR>", options)

-- (toggle) terminal
map("n", "<leader>t", ":ToggleTerm<CR>", options)
map("t", "<esc>", [[<C-\><C-n>]], options)

-- custom utils
map("n", "<leader>gb", ":lua require('heftyfunseeker.utils').git_browse()<CR>", options)

-- neogit
map("n", "<leader>gv", ":lua require('neogit').open({ kind = \"vsplit\" })<CR>", options)
map("n", "<leader>g", ":lua require('neogit').open()<CR>", options)

-- Trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", options)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", options)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", options)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", options)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", options)
map("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", options)

-- Dap
map("n", "<leader>b", [[:lua require("dap").toggle_breakpoint()<CR>]], options)
map("n", "<leader>B", [[:lua require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], options)
map("n", "<leader>dl", [[:lua require("dap").run_last()<CR>]], options)
map("n", "<leader>dc", [[:lua require("dap").continue()<CR>]], options)
map("n", "<leader>di", [[:lua require("dap").step_into()<CR>]], options)
map("n", "<leader>do", [[:lua require("dap").step_over()<CR>]], options)
map("n", "<leader>du", [[:lua require("dap").step_out()<CR>]], options)
map("n", "<leader>dd", [[:lua require("dapui").toggle()<CR>]], options)

-- lsp config
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>", options)
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", options)
map("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", options)
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", options)
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", options)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", options)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", options)
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", options)
map(
  "n",
  "<space>wa",
  "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
  options
)
map(
  "n",
  "<space>wr",
  "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
  options
)
map(
  "n",
  "<space>wl",
  "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
  options
)
map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", options)
map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", options)
map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", options)
map("n", "<space>f", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", options)
