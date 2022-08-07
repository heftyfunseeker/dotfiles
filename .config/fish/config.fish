if status is-interactive
    # Commands to run in interactive sessions can go here
end

set PATH $PATH $HOME/.local/bin

set PATH $PATH $HOME/.cargo/bin
set PATH $PATH $HOME/.cargo/env

# homebrew for linux
if test uname = "linux"
  eval "(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

starship init fish | source

