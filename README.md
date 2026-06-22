# My Dotfiles

NEVER USE APT PACKAGES OUTDATED AF

## Quick Setup

For a fully automated setup, run the installation script:

```bash
chmod +x setup.sh
./setup.sh
```

This script bootstraps Homebrew if needed, installs or updates the repo's command-line dependencies, sets up JetBrainsMono Nerd Font, Neovim, TPM, nvm, and Node LTS, and prints a short status report at the end.

The script writes shared PATH setup to `~/.profile.d/dotfiles-path.sh` and sources it from common shell startup files. The stowed `zsh/.zshrc` remains portable: Homebrew, the generated profile snippet, and `/opt/nvim-linux-x86_64/bin` are only loaded when they exist, so the same zsh config can be used on non-Debian or non-Homebrew systems.

## Install All Dependencies Arch
```
sudo pacman -S stow ttf-jetbrains-mono-nerd fzf tmux zoxide yq lazygit git-delta ripgrep zsh
chsh -s $(which zsh)
curl -sS https://starship.rs/install.sh | sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Install Stow

https://www.gnu.org/software/stow/
https://learn.typecraft.dev/tutorial/never-lose-your-configs-again/

## Symlink the config files

```
stow [package]
```

where [package] is is replaced by the folder you want to symlink

## Install Dependencies

Install Zsh
Handled by `./setup.sh`.

Install ohmyposh
https://ohmyposh.dev/
```
curl -s https://ohmyposh.dev/install.sh | bash -s
```

Install Starship
```
curl -sS https://starship.rs/install.sh | sh
```

Install Nerd Fonts
```
# Fetch latest version
NERD_FONTS_LATEST=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep -Po '"tag_name": "\K[^"]*')
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONTS_LATEST}/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv
```
For Windows, download unzip and install

Install Fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo rm -rf ~/.fzf  
```

Install Tmux
https://github.com/tmux/tmux
Handled by `./setup.sh`.

Install TPM
```
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
```
Open TMUX press C-b + I to install packages

Install Zoxide
```
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```
Install Lazygit
Handled by `./setup.sh`.

Install Delta
https://dandavison.github.io/delta/installation.html
Handled by `./setup.sh`.

Shell Color Scripts
```
git clone https://github.com/shreyas-a-s/shell-color-scripts.git
cd shell-color-scripts
sudo make install

```

Hub (for nvim snacks github) (https://github.com/mislav/hub)
Optional: install separately if you use it.

Install tmuxifier
```
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
```
Install Ripgrep
https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation
Handled by `./setup.sh`.
To Install All language server properly follow and complete everything listed in :help lspconfig-all, find the list of servers from lspconfig.lua in the "servers" table

## Stow list
For Ubuntu
Run this when inside git directory
```
stow lazygit nvim starship tmux zsh
```
