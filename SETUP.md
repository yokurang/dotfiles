
### **README.md**

Keep your current setup instructions there — just remove the “Developer Environment Setup” section and replace it with a short pointer like this:

```markdown
## 3. Developer Environment Setup

For full setup instructions (GitHub, VS Code, Python, Rust, C++), see [DEV_SETUP.md](./DEV_SETUP.md).
```

---

### **DEV SETUP**

This will contain everything that used to be in your “Developer Environment Setup” section, as a standalone doc:

````markdown
# Developer Environment Setup

This document provides optional steps to set up your development environment from scratch on **macOS** or **Linux**, including GitHub, VS Code, Python, Rust, and C++.

---

## 1. Git & GitHub Setup

1. **Set up Git identity:**

   ```bash
   git config --global user.name "Your Name"
   git config --global user.email "you@example.com"
   git config --global init.defaultBranch main
   git config --global core.editor "vim"
````

2. **Generate an SSH key:**

   ```bash
   ssh-keygen -t ed25519 -C "you@example.com"
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   cat ~/.ssh/id_ed25519.pub
   ```

3. Copy the output and **add it to GitHub**:

   * Go to **GitHub → Settings → SSH and GPG keys → New SSH key**
   * Paste and save.

4. **Test your connection:**

   ```bash
   ssh -T git@github.com
   ```

---

## 2. VS Code Setup

1. **Install VS Code extensions:**

   ```bash
   code --install-extension ms-python.python
   code --install-extension rust-lang.rust-analyzer
   code --install-extension ms-vscode.cpptools
   code --install-extension eamodio.gitlens
   code --install-extension esbenp.prettier-vscode
   code --install-extension vscodevim.vim
   ```

2. **Sync your settings:**

   Open the Command Palette → “Turn on Settings Sync”.

---

## 3. Python Setup

1. **Upgrade pip & install developer tools:**

   ```bash
   python3 -m pip install --upgrade pip
   pip install virtualenv ipython black flake8
   ```

2. **Optional – Create a virtual environment:**

   ```bash
   python3 -m venv ~/.venvs/dev
   source ~/.venvs/dev/bin/activate
   ```

---

## 4. Rust Setup

1. **Install via rustup (recommended):**

   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   source "$HOME/.cargo/env"
   ```

2. **Install useful developer tools:**

   ```bash
   cargo install ripgrep bat exa fd-find tokei cargo-edit
   ```

---

## 5. C++ Setup

1. **Install compiler and build tools:**

   ```bash
   brew install gcc cmake make ninja
   ```

   or on Linux:

   ```bash
   sudo apt install -y g++ cmake make ninja-build
   ```

2. **Test compilation:**

   ```bash
   echo '#include <iostream>
   int main() { std::cout << "Hello, C++!" << std::endl; }' > test.cpp
   g++ test.cpp -o test && ./test
   ```

---

## 6. Verify Environment

Run these to confirm everything is working:

```bash
python3 --version
rustc --version
g++ --version
git --version
code --version
```

---

## 7. Optional: Productivity Tools

```bash
brew install --cask \
  notion \
  obsidian \
  slack \
  discord
```

---
