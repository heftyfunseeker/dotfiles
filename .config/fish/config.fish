if status is-interactive
    # Commands to run in interactive sessions can go here
end

# llvm exports
set -Ux LIBCLANG_PATH /Library/Developer/CommandLineTools/usr/lib
set -Ux LD_LIBRARY_PATH /Library/Developer/CommandLineTools/usr/lib
set -Ux DYLD_LIBRARY_PATH /Library/Developer/CommandLineTools/usr/lib

# set -Ux MERLIN_BINARY $HOME/disneystreaming/ncp-m5/build/bin/emu_stb_gpu_macosx_arm64/debug/merlin.app
#set -Ux MERLIN_BINARY $HOME/disneystreaming/dmgz-adk-app/target/deps/merlin/debug/merlin.app

# set MAC_ARM64_EXTENSIONS $HOME/disneystreaming/ncp-m5/build/bin/emu_stb_gpu_macosx_arm64/debug/extensions/

# set -Ux  CARGO_M5_BUILD_DIR $HOME/disneystreaming/ncp-m5/build/bin/emu_stb_gpu_macosx_arm64/debug

set PATH $PATH $HOME/.local/bin

set PATH $PATH $HOME/.cargo/bin
set PATH $PATH $HOME/.cargo/env
set PATH $PATH $LIBCLANG_PATH

alias run_d_plus_mac_arm64="CONFIG_ENV=prod CONFIG_DOMAIN=dev http_proxy=socks5h://localhost:8889 https_proxy=socks5h://localhost:8889 $MERLIN_BINARY  --wasm target/wasm32-unknown-unknown/release/dmgz_adk_app.wasm"

alias run_d_plus_mac_arm64_qa="DISPLAY_MODE=1280x720 CONFIG_ENV=qa CONFIG_DOMAIN=dev http_proxy=socks5h://localhost:8889 https_proxy=socks5h://localhost:8889 $MERLIN_BINARY --extensions target/debug/extensions/ --wasm target/wasm32-unknown-unknown/release/dmgz_adk_app.wasm"

# rbenv init
set -gx PATH '/Users/niccosimone/.rbenv/shims' $PATH
set -gx RBENV_SHELL fish
command rbenv rehash 2>/dev/null
function rbenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    rbenv "sh-$command" $argv|source
  case '*'
    command rbenv "$command" $argv
  end
end

starship init fish | source

