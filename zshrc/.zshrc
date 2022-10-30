export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export ZSH_WEB_SEARCH_ENGINES=(reddit "https://www.reddit.com/search/?q=")

ZSH_THEME="gnzh"

plugins=(
    git
    copypath  # `copypath` <path> to copy path to clipboard
    copyfile # `copyfile` <file> to copy file to clipboard
    colorize
    colored-man-pages
    vi-mode
    archlinux
    web-search
    jump
    aliases
    extract
    universalarchive
    zsh-interactive-cd
    zsh-navigation-tools
    zsh-autosuggestions
    zsh-syntax-highlighting
)


source $ZSH/oh-my-zsh.sh

autoload znt-history-widget
zle -N znt-history-widget
bindkey "^R" znt-history-widget

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"


# Install global npm pacakges without sudo
NPM_PACKAGES="${HOME}/.local/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

[ ! -d "~/.cargo/bin/" ] && export PATH="$PATH:${HOME}/.cargo/bin"
[ ! -d "~/go/bin/" ] && export PATH="$PATH:${HOME}/go/bin"

