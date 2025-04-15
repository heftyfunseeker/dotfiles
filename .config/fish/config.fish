if status is-interactive
    # Commands to run in interactive sessions can go here
end

# llvm exports
set -Ux LIBCLANG_PATH /Library/Developer/CommandLineTools/usr/lib
set -Ux LD_LIBRARY_PATH /Library/Developer/CommandLineTools/usr/lib
set -Ux DYLD_LIBRARY_PATH /Library/Developer/CommandLineTools/usr/lib

set PATH $PATH $HOME/.local/bin

set PATH $PATH $HOME/.cargo/bin
set PATH $PATH $HOME/.cargo/env
set PATH $PATH $LIBCLANG_PATH

set -Ux N_PREFIX $HOME/n
set -Ux fish_user_paths $N_PREFIX/bin $fish_user_paths

starship init fish | source

