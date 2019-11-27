# History file
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# vi keys
bindkey -v

# Completion
zstyle :compinstall filename '${HOME}/.zshrc'
autoload -Uz compinit
compinit

# Declare terminal colour support (required by tmux)
export TERM='xterm-256color'

# Set editor
export EDITOR=vim
export VISUAL=$EDITOR

# Add ruby path
if [ -f /usr/bin/ruby ]; then
  export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
  export PATH="$PATH:$GEM_HOME/bin"
fi

# Powerlevel9k theme settings
source ~/.zsh/powerlevel9k.zsh

# Solarized dir colors
eval `dircolors ~/.dir_colors`

# Autosuggest settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10,underline"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true
bindkey '^ ' autosuggest-accept

# zplug
source ~/.zsh/zplug.zsh

# Aliases
alias ll='ls -l'
alias la='ls -A'
alias ls='ls --color=auto --group-directories-first'

alias cgrep='grep -n --color'

alias news='archnews -w 72 -u'

function dusort() {
du -shc --time .??* * | sort -h
}
