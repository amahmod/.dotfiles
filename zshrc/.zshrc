export ZSH="$HOME/.oh-my-zsh"
export editor="nvim"

ZSH_THEME="agnoster"

plugins=(
	git
	yarn
	docker 
	copypath
	copyfile
	colorize
	vi-mode
	node
	archlinux
	npm
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

