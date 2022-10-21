if status is-interactive
    # Commands to run in interactive sessions can go here
end

# llvm exports
set -Ux LIBCLANG_PATH /Library/Developer/CommandLineTools/usr/lib
set -Ux LD_LIBRARY_PATH /Library/Developer/CommandLineTools/usr/lib
set -Ux DYLD_LIBRARY_PATH /Library/Developer/CommandLineTools/usr/lib

set -Ux MERLIN_BINARY $HOME/disneystreaming/ncp-m5/build/bin/emu_stb_gpu_macosx_arm64/debug/merlin.app
set MAC_ARM64_EXTENSIONS $HOME/disneystreaming/ncp-m5/build/bin/emu_stb_gpu_macosx_arm64/debug/extensions/

set -Ux  CARGO_M5_BUILD_DIR $HOME/disneystreaming/ncp-m5/build/bin/emu_stb_gpu_macosx_arm64/debug

set PATH $PATH $HOME/.local/bin

set PATH $PATH $HOME/.cargo/bin
set PATH $PATH $HOME/.cargo/env
set PATH $PATH $LIBCLANG_PATH

alias run_d_plus_mac_arm64="CONFIG_ENV=prod CONFIG_DOMAIN=dev http_proxy=socks5h://localhost:8889 https_proxy=socks5h://localhost:8889 $MERLIN_BINARY --extensions target/debug/extensions/ --wasm target/wasm32-unknown-unknown/release/dmgz_adk_app.wasm"

alias run_d_plus_mac_arm64_qa="CONFIG_ENV=qa CONFIG_DOMAIN=dev http_proxy=socks5h://localhost:8889 https_proxy=socks5h://localhost:8889 $MERLIN_BINARY --extensions target/debug/extensions/ --wasm target/wasm32-unknown-unknown/release/dmgz_adk_app.wasm"

starship init fish | source

