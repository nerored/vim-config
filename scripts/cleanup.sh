#!/usr/bin/env bash

source ./scripts/format.sh

cache_vim="$HOME/.cache/vim"
generator="$HOME/.config/nvim/bin/generator"

action "Running Clean up..."

running "Remove the plugins install folder"
rm -rf cache_vim

ok "===>  Clean up Success"

