# Clone zplug if it has not been already
if ! [ -d ~/.zplug ]; then
    git clone https://github.com/zplug/zplug ~/.zplug
fi

# Source zplug
source ~/.zplug/init.zsh

# Let zplug manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Plugins
zplug 'romkatv/powerlevel10k', as:theme, depth:1
zplug 'wfxr/forgit'
zplug 'zdharma-continuum/fast-syntax-highlighting'
zplug 'zdharma-continuum/history-search-multi-word'
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
if [[ -d /opt/homebrew/opt/fzf/shell ]]; then
    zplug '/opt/homebrew/opt/fzf/shell', from:local, use:"*.zsh"
fi

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load plugins
zplug load
