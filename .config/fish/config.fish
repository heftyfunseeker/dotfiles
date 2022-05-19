if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PATH $PATH $HOME/.local/bin
set PATH $PATH $HOME/.cargo/bin
set PATH $PATH $HOME/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin
set PATH $PATH $HOME/.local/share/nvim/lsp_servers/rust_analyzer/

starship init fish | source

