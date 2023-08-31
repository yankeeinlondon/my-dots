#!/bin/bash

echo "Resetting Neovim's cached values in:"
echo "  ~/.local/share/nvim"
echo "  ~/.local/state/nvim"
echo "  ~/.cache/nvim"

rm -rf "${HOME}/.local/share/nvim"
rm -rf "${HOME}/.local/state/nvim"
rm -rf "${HOME}/.cache/nvim"

echo ""
echo "- now removing the packer config file"
rm "${HOME}/.config/nvim/plugin/packer_compiled.lua"
echo "- now when you run neovim it will reinstall everything"
