-- Optional: be resilient if cmp_nvim_lsp isn't installed
local capabilities = vim.lsp.protocol.make_client_capabilities()
pcall(function()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
end)

local ok_navic, navic = pcall(require, "nvim-navic")
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}
local on_attach = function(client, bufnr)
  if ok_navic and client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

-- === rust ===
vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  -- native API uses root_markers (NOT root_dir)
  root_markers = { "Cargo.toml", "rust-project.json", ".git" },
  single_file_support = true,
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  settings = {
    ["rust-analyzer"] = {
      cargo = { features = { "use-archie" } },
      checkOnSave = true,
      check = {
        command = "clippy",
        extraArgs = { "--offline" },
      },
      rustfmt = {
        overrideCommand = { "leptosfmt", "--stdin", "--rustfmt" },
      },
    },
  },
})

-- === lua ===
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json", ".luarc.jsonc", ".luacheckrc",
    "stylua.toml", ".stylua.toml", "selene.toml", "selene.yml", ".git",
  },
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

-- === json ===
vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" }, -- or "vscode-json-languageserver"
  filetypes = { "json", "jsonc" },
  root_markers = { "package.json", ".git" },
  init_options = { provideFormatter = true },
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  settings = { json = { validate = { enable = true } } },
})

-- diagnostics
local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end
lspSymbol("Error", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- enable native configs (names must match above)
vim.lsp.enable({ "rust_analyzer", "lua_ls", "jsonls" })
