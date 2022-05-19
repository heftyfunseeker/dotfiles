-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'rust_analyzer', 'sumneko_lua' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    -- on_attach = function() end,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")

vim.diagnostic.config {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
}
