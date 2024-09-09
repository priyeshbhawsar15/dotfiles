# My Dotfiles

NEVER USE APT PACKAGES OUTDATED AF

## Install Stow

https://www.gnu.org/software/stow/
https://learn.typecraft.dev/tutorial/never-lose-your-configs-again/
https://www.gnu.org/software/stow/

## Symlink the config files

```
stow [package]
```

where [package] is is replaced by the folder you want to symlink

## Install Dependencies

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
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv
```
For Windows, download unzip and install

Install Fzf

Install Tmux
```
sudo apt-get install libevent-dev ncurses-dev build-essential bison pkg-config
tar -zxf tmux-*.tar.gz
cd tmux-*/
./configure
make && sudo make install
```
Install TPM
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Open TMUX press C-b + I to install packages

Install Zoxide

Install Zsh

Install Lazygit
```
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

Install tmuxifier
```
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
```
