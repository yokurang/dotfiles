# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the path to the oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Load NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# Add Composer's global binaries to the PATH
export PATH=$PATH:~/.composer/vendor/bin

# Set Zsh theme to Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set the Zsh plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
source $ZSH/oh-my-zsh.sh

# User Configuration

# PHP settings
export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"

# Golang configuration
export GOROOT=/opt/homebrew/Cellar/go/1.21.5/libexec
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export GOBIN=$GOPATH/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Rust configuration
export PATH="$HOME/.cargo/bin:$PATH"

# Python Poetry
export PATH="$HOME/.local/bin:$PATH"

# C++ configuration (assuming you want LLVM from Homebrew for Clang/LLVM tools)
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# Configuration for Apple Silicon Mac
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Load Powerlevel10k theme config if it exists
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export OPAMSWITCH=default

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/yokurang/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yokurang/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yokurang/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yokurang/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# opam configuration
[[ ! -r /Users/yokurang/.opam/opam-init/init.zsh ]] || source /Users/yokurang/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
eval $(opam env)

export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/flex/bin:$PATH"
