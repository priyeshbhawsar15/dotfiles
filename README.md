# My Dotfiles

## Install Stow

https://www.gnu.org/software/stow/
https://learn.typecraft.dev/tutorial/never-lose-your-configs-again/

```
sudo apt install stow
```

## Symlink the config files

For NVIM
```
stow nvim
```

For ZSH
```
Stow zsh
```

Install ohmyposh
https://ohmyposh.dev/
```
curl -s https://ohmyposh.dev/install.sh | bash -s
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

