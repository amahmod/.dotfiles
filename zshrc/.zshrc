export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

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

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"


NPM_PACKAGES="${HOME}/.local/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
