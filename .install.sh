#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

echo >> $HOME/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae

# Brew Formulae
brew install stow 
brew install neovim
brew install asdf
brew install tree
brew install tmux
brew install atuin
brew install zoxide
brew install wget
brew install jq
brew install gh
brew install ripgrep
brew install neofetch
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install koekeishiya/formulae/skhd
brew install koekeishiya/formulae/yabai
brew install borders
brew install sketchybar
brew install lazygit

# Brew Casks
echo "Installing Brew Casks..."
brew install --cask font-hack-nerd-font
brew install --cask vlc


# Installing Fonts
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Start Services
echo "Starting Services (grant permissions)..."
skhd --start-service
brew services start sketchybar

csrutil status
echo "Do not forget to disable SIP"
echo "Add sudoer manually:\n '$(whoami) ALL = (root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | awk "{print \$1;}") $(which yabai) --load-sa' to '/private/etc/sudoers.d/yabai'"

stow atuin
stow nvim
stow zsh --adopt
stow oh-my-zsh
stow skhd
stow sketchybar
stow yabai

source $HOME/.zshrc
