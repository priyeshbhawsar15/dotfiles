#! /bin/bash

sudo apt update && sudo apt upgrade -y && sudo apt-get install stow ripgrep hub libevent-dev ncurses-dev build-essential bison pkg-config sudo curl zsh wget -y
 
curl -sS https://starship.rs/install.sh | sh
 
cd
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
 
cd
wget https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz
tar -zxf tmux-3.5a.tar.gz
cd tmux-3.5a/
./configure
make && sudo make install
 
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
 
cd
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
 
cd
git clone https://github.com/shreyas-a-s/shell-color-scripts.git
cd shell-color-scripts
sudo make install
 
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
 
cd
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-x86_64.tar.gz
tar xzf nvim-macos-x86_64.tar.gz
./nvim-macos-x86_64/bin/nvim

cd
curl -LO https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb
dpkg -i git-delta_0.18.2_amd64.deb
 
sudo add-apt-repository ppa:rmescandon/yq
sudo apt update
sudo apt install yq -y
 
#language-servers
npm i -g css-variables-language-server typescript typescript-language-server vscode-langservers-extracted @microsoft/compose-language-service vscode-langservers-extracted @tailwindcss/language-server
