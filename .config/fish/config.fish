if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PATH $PATH $HOME/.local/bin
set PATH $PATH $HOME/.cargo/bin

starship init fish | source

