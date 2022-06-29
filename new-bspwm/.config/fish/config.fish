# Flutter 
set -Ua fish_user_paths ~/flutter/bin 

set -Ua fish_user_paths ~/Android/Sdk/cmdline-tools/latest/bin
# export PATH=$ANDROID_SDK_ROOT/bin:$PATH

# Golang
set -Ua fish_user_paths /usr/local/go/bin

# NodeJS fix Issues
# export NODE_OPTIONS=--openssl-legacy-provider

alias nv="~/.local/share/applications/Neovim/./nvim.appimage"

# set -Ua fish_user_paths SDKMAN_DIR="~/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# THEME PURE #
set fish_function_path /home/yuu/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /home/yuu/.config/fish/functions/theme-pure/conf.d/pure.fish
