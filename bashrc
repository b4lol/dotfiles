# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH="/home/user/.local/bin:/usr/local/bin:$PATH"

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Custom Aliases
alias ls='eza --icons=auto --group-directories-first'
alias ll='eza -la --icons=auto --group-directories-first'
alias tree='eza --tree --icons=auto'
alias cat='bat --style=plain'
alias top='btop'
alias grep='grep --color=auto'
alias cls='clear'

# Starship Prompt Initialization
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

# Show Fastfetch system summary on interactive shell launch
if [[ $- == *i* ]] && command -v fastfetch &>/dev/null; then
    fastfetch
fi
