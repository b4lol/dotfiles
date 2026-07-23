# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set ZSH_THEME="" so Starship handles prompt rendering cleanly
ZSH_THEME=""

# Oh My Zsh Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User environment variables & PATH
export PATH="/home/user/.local/bin:/usr/local/bin:$PATH"

# Custom Aliases
alias ls='eza --icons=auto --group-directories-first'
alias ll='eza -la --icons=auto --group-directories-first'
alias tree='eza --tree --icons=auto'
alias cat='bat --style=plain'
alias top='btop'
alias grep='grep --color=auto'
alias cls='clear'

# Starship Prompt Initialization for Zsh
if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# Show Fastfetch system summary on interactive shell launch
if [[ $- == *i* ]] && command -v fastfetch &>/dev/null; then
    fastfetch
fi
