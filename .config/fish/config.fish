if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PATH $PATH $HOME/.local/bin

set PATH $PATH $HOME/.cargo/bin
set PATH $PATH $HOME/.cargo/env

# lsp servers
set PATH $PATH $HOME/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin
set PATH $PATH $HOME/.local/share/nvim/lsp_servers/rust_analyzer/
set PATH $PATH $HOME/.local/share/nvim/lsp_servers/eslint/node_modules/vscode-langservers-extracted
set PATH $PATH $HOME/.local/share/nvim/lsp_servers/eslint/node_modules/vscode-langservers-extracted/bin
set PATH $PATH $HOME/.local/share/nvim/lsp_servers/eslint/node_modules/vscode-langservers-extracted/lib
set PATH $PATH $HOME/.local/share/nvim/lsp_servers/tsserver/node_modules/typescript-language-server

# homebrew for linux
if test uname = "linux"
  eval "(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

starship init fish | source

