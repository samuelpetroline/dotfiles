#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae

# Brew Formulae
brew install neovim
brew install asdf
brew install tree
brew install wget
brew install jq
brew install gh
brew install ripgrep
brew install neofetch
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install koekeishiya/formulae/skhd
brew install koekeishiya/formulae/yabaibrew
brew install sketchybar

# Brew Casks
echo "Installing Brew Casks..."
brew install --cask font-hack-nerd-font
brew install --cask vlc

# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Copy dotfiles to $HOME
echo "Copying dotfiles to $HOME"
cp .skhdrc $HOME
cp .yabairc $HOME
cp .zshrc $HOME

source $HOME/.zshrc

# Start Services
echo "Starting Services (grant permissions)..."
skhd --start-service
brew services start yabai
brew services start sketchybar

csrutil status
echo "Do not forget to disable SIP"
echo "Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"
