#!/bin/bash

echo "Installing dependencies..."

echo "Symlinking Config Files"
# Zsh
ln -sfT "$HOME/.dotfiles/Zsh/.zshenv" "$HOME/.zshenv"
ln -sfT "$HOME/.dotfiles/Zsh/.zshrc" "$HOME/.zshrc"
ln -sfT "$HOME/.dotfiles/Zsh/.zsh_aliases" "$HOME/.zsh_aliases"
source "$HOME/.zshrc"
