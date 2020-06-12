# vi keys
bindkey -v

# zplug
source ~/.zsh/zplug.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History file
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_SPACE

# Completion
zstyle :compinstall filename '${HOME}/.zshrc'
autoload -Uz compinit
compinit -u

# Set editor
export EDITOR=vim
export VISUAL=$EDITOR

# Set GPG tty
export GPG_TTY=$(tty)

# Add ruby path
if [ -f /usr/bin/ruby ]; then
  export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
  export PATH="$PATH:$GEM_HOME/bin"
fi

# Add homebrew path
export PATH="/usr/local/bin:$PATH"

# Add texlive path
export PATH="$PATH:/Library/TeX/texbin"

# Add Python 3.8 path
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# Powerlevel10k theme settings
if [ -f ~/.zsh/p10k.zsh ]; then
    source ~/.zsh/p10k.zsh
fi

# Solarized dir colors
export LSCOLORS=exfxfeaeBxxehehbadacea

# Autosuggest settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10,underline"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
bindkey '^ ' autosuggest-accept

# fzf settings
# Solarized colors
export FZF_DEFAULT_OPTS='
  --color=bg+:#073642,bg:#002b36,spinner:#719e07,hl:#586e75
  --color=fg:#839496,header:#586e75,info:#cb4b16,pointer:#719e07
  --color=marker:#719e07,fg+:#839496,prompt:#719e07,hl+:#719e07
'

# Aliases
if [ -x "$(command -v exa)" ]; then
    alias ls='exa --color=auto --group-directories-first'
    alias ll='exa -l'
    alias la='exa -a'
else
    alias ll='ls -l'
    alias la='ls -A'
    alias ls='ls -G'
fi

function pipgrade() {
    pip install --upgrade $(pip list --outdated --format=freeze | cut -f 1 -d '=')
}

function pacfzf() {
    pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
}
