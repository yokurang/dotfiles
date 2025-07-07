# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the path to the oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set Zsh theme to Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set the Zsh plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)
source $ZSH/oh-my-zsh.sh

# Rust configuration
export PATH="$HOME/.cargo/bin:$PATH"

# C++ configuration (assuming you want LLVM from Homebrew for Clang/LLVM tools)
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# Use system compiler for C++ builds 
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# Configuration for Apple Silicon Mac
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"

# Load Powerlevel10k theme config if it exists
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# opam configuration
[[ ! -r /Users/yokurang/.opam/opam-init/init.zsh ]] || source /Users/yokurang/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
eval $(opam env)

export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/flex/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c@76/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c@76/sbin:$PATH"


# C#
export DOTNET_ROOT="/opt/homebrew/share/dotnet"
export PATH="$DOTNET_ROOT:$PATH"

