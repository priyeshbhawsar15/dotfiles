#! /bin/bash

# Update and install packages
sudo apt update && sudo apt upgrade -y && sudo apt-get install stow ripgrep unzip hub libevent-dev ncurses-dev build-essential bison pkg-config lazygit curl zsh wget libatomic1 -y

cd
# Install JetBrainsMono Nerd Font
NERD_FONTS_LATEST=$(curl -s https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest | grep -Po '"tag_name": "\K[^"]*')
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONTS_LATEST}/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv
 
# Install Starship
cd
curl -sS https://starship.rs/install.sh | sh
 
# Install fzf
cd
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
 
# Fetch latest tmux release info
cd
TMUX_LATEST=$(curl -s https://api.github.com/repos/tmux/tmux/releases/latest | grep -Po '"tag_name": "\K[^"]*')
TMUX_URL="https://github.com/tmux/tmux/releases/download/${TMUX_LATEST}/tmux-${TMUX_LATEST}.tar.gz"
wget $TMUX_URL
tar -zxf tmux-${TMUX_LATEST}.tar.gz
cd tmux-${TMUX_LATEST}/
./configure
make && sudo make install
cd ..
rm -rf tmux-${TMUX_LATEST}/ tmux-${TMUX_LATEST}.tar.gz
 
# Install tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
 
# Install zoxide
cd
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
 
# Install shell color scripts
cd
git clone https://github.com/shreyas-a-s/shell-color-scripts.git
cd shell-color-scripts
sudo make install
 
# Install tmuxifier
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
 
# Install NVIM
cd 
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Fetch latest delta release info
cd
DELTA_LATEST=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | grep -Po '"tag_name": "\K[^"]*')
DELTA_URL="https://github.com/dandavison/delta/releases/download/${DELTA_LATEST}/git-delta_${DELTA_LATEST}_amd64.deb"
wget $DELTA_URL
sudo dpkg -i git-delta_${DELTA_LATEST}_amd64.deb
rm git-delta_${DELTA_LATEST}_amd64.deb
 
# Install yq
cd
sudo add-apt-repository ppa:rmescandon/yq
sudo apt update
sudo apt install yq -y
 
#language-servers
cd
npm i -g css-variables-language-server typescript typescript-language-server vscode-langservers-extracted @microsoft/compose-language-service vscode-langservers-extracted @tailwindcss/language-server

# Installation Status Report
echo
echo "==============================="
echo "  INSTALLATION STATUS REPORT   "
echo "==============================="
echo

echo "✓ Checking Successful Installations:"
echo "======================================"

# Check system packages
echo -n "System packages (stow, ripgrep, etc.): "
if command -v stow >/dev/null 2>&1 && command -v rg >/dev/null 2>&1; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

# Check JetBrainsMono font
echo -n "JetBrainsMono Nerd Font: "
if [ -d ~/.local/share/fonts ] && ls ~/.local/share/fonts/*JetBrains* >/dev/null 2>&1; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

# Check Starship
echo -n "Starship prompt: "
if command -v starship >/dev/null 2>&1; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

# Check fzf
echo -n "fzf fuzzy finder: "
if [ -d ~/.fzf ]; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

# Check tmux
echo -n "tmux terminal multiplexer: "
if command -v tmux >/dev/null 2>&1; then
    echo "✅ INSTALLED ($(tmux -V))"
else
    echo "❌ FAILED"
fi

# Check tmux plugins
echo -n "tmux plugin manager: "
if [ -d ~/.tmux/plugins/tpm ]; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

# Check zoxide
echo -n "zoxide smart cd: "
if command -v zoxide >/dev/null 2>&1; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

# Check shell color scripts
echo -n "shell-color-scripts: "
if command -v colorscript >/dev/null 2>&1; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

# Check tmuxifier
echo -n "tmuxifier: "
if [ -d ~/.tmuxifier ]; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

# Check neovim
echo -n "Neovim editor: "
if [ -d /opt/nvim-linux-x86_64 ]; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

# Check delta
echo -n "delta diff viewer: "
if command -v delta >/dev/null 2>&1; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

# Check yq
echo -n "yq YAML processor: "
if command -v yq >/dev/null 2>&1; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

# Check npm packages
echo -n "Language servers (npm): "
if command -v npm >/dev/null 2>&1 && npm list -g typescript-language-server >/dev/null 2>&1; then
    echo "✅ INSTALLED"
else
    echo "❌ FAILED"
fi

echo
echo "==============================="
echo "   SETUP COMPLETE!             "
echo "==============================="
echo "Please restart your terminal or run 'source ~/.bashrc' to apply changes."
echo
