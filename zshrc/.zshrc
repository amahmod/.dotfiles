export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"

ZSH_THEME="gnzh"

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


# Install global npm pacakges without sudo
NPM_PACKAGES="${HOME}/.local/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
