#! /bin/bash

CYAN="\033[0;36m"
GREEN="\033[1;32m"
NC="\033[0m"

echo "${CYAN}Installing necessary utilities{$NC}"
brew bundle 

echo "${CYAN}Installing fonts{$NC}"
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font

echo "${CYAN}Creating symlinks{$NC}"
for file in "$PWD"/dotfiles/*; do
	ln -s "$file" "$HOME/.$(basename "$file")"
done

echo "${CYAN}Installing nvim {$NC}"
ln -s "$PWD"/nvim ~/.config/nvim

echo "${CYAN}Installing zsh{$NC}"
ln -s "$PWD"/zsh ~/.config/zsh

echo "${GREEN}Installation complete!${NC}"

