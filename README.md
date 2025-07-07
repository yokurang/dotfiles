# Dotfiles

This repository contains my configuration files for Zsh, Vim, tmux, Kitty, and Emacs. Follow the steps below to set up your environment on **macOS** or **Linux**.

---

## 1. Prerequisites & Package Installation

### macOS (using Homebrew)

1. **Install Homebrew** (if you don’t have it):

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
2. **Install core packages**:

   ```bash
   brew update
   brew install \
     zsh \
     tmux \
     vim \
     emacs --cask \
     kitty
   ```

### Linux (Debian/Ubuntu)

1. **Install core packages**:

   ```bash
   sudo apt update
   sudo apt install -y \
     zsh \
     tmux \
     vim \
     emacs \
     kitty
   ```

> On other distributions, replace `apt` with your package manager (`pacman`, `dnf`, etc.).

---

## 2. Shell & Editor Bootstrapping

### Zsh & Oh My Zsh

1. **Install Oh My Zsh**:

   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```
2. **Install plugins**:

   ```bash
   git clone https://github.com/zsh-users/zsh-autosuggestions \
     ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
     ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   ```

3. **Install Powerlevel10k**:

   ```bash
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
     ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
   ```
4. **Make Zsh your default shell**:

   ```bash
   chsh -s "$(which zsh)"
   ```

### Vim & Vim-Plug

1. **Install Vim-Plug**:

   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```
2. **On first Vim launch**, run:

   ```vim
   :PlugInstall
   ```

### tmux & TPM (tmux Plugin Manager)

1. **Clone TPM** (if your `.tmux.conf` expects it):

   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```
2. **In tmux**, press your prefix (e.g. `Ctrl-a`) then `I` (capital i) to install plugins.

### Emacs & Packages

1. **Open Emacs**; `use-package` declarations will auto-install missing packages.
2. If needed, run:

   ```elisp
   M-x package-refresh-contents RET
   M-x package-install-selected-packages RET
   ```

### Kitty

No additional bootstrapping is required—your `kitty.conf` will be symlinked below.

---

## 3. Clone & Symlink Dotfiles

```bash
# Clone your repo
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Zsh & Vim
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# tmux, Kitty, Emacs (directories)
mkdir -p ~/.config
ln -sf ~/dotfiles/tmux       ~/.config/tmux
ln -sf ~/dotfiles/kitty      ~/.config/kitty
ln -sf ~/dotfiles/emacs      ~/.config/emacs
```

---

## 4. Post-Installation

* **Restart your terminal** or run:

  ```bash
  source ~/.zshrc
  ```
* **Launch tmux** and press `<PREFIX> + I` to fetch plugins.
* **Open Emacs**; it will install and configure all packages automatically.
