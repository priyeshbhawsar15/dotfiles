# My Dotfiles

NEVER USE APT PACKAGES OUTDATED AF

## Quick Setup (Debian/Ubuntu)

For a fully automated setup, run the installation script:

```bash
chmod +x setup_debian.sh
./setup_debian.sh
```

This script will:
- Install all required dependencies (latest versions)
- Set up fonts, terminals tools, and development utilities
- Provide a detailed status report at the end

## Install All Dependencies Arch
```
sudo pacman -S stow ttf-jetbrains-mono-nerd fzf tmux zoxide lazygit git-delta ripgrep zsh
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
```
sudo apt install zsh
```
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
```
sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config
# Fetch latest tmux release
TMUX_LATEST=$(curl -s https://api.github.com/repos/tmux/tmux/releases/latest | grep -Po '"tag_name": "\K[^"]*')
wget https://github.com/tmux/tmux/releases/download/${TMUX_LATEST}/tmux-${TMUX_LATEST}.tar.gz
tar -zxf tmux-${TMUX_LATEST}.tar.gz
cd tmux-${TMUX_LATEST}/
./configure
make && sudo make install
cd ..
rm -rf tmux-${TMUX_LATEST}/ tmux-${TMUX_LATEST}.tar.gz
```
Install TPM
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Open TMUX press C-b + I to install packages

Install Zoxide
```
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```
Install Zoxide
```
sudo apt install lazygit
```
Install Delta
https://dandavison.github.io/delta/installation.html
```
# Fetch latest delta release
DELTA_LATEST=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | grep -Po '"tag_name": "\K[^"]*')
wget https://github.com/dandavison/delta/releases/download/${DELTA_LATEST}/git-delta_${DELTA_LATEST}_amd64.deb
sudo dpkg -i git-delta_${DELTA_LATEST}_amd64.deb
rm git-delta_${DELTA_LATEST}_amd64.deb
```

Shell Color Scripts
```
git clone https://github.com/shreyas-a-s/shell-color-scripts.git
cd shell-color-scripts
sudo make install

```

Hub (for nvim snacks github) (https://github.com/mislav/hub)
```
sudo apt install hub
```

Install tmuxifier
```
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
```
Install Ripgrep
https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation
```
sudo apt-get ripgrep
```
To Install All language server properly follow and complete everything listed in :help lspconfig-all, find the list of servers from lspconfig.lua in the "servers" table

## Stow list
For Ubuntu
Run this when inside git directory
```
stow lazygit nvim starship tmux zsh
```