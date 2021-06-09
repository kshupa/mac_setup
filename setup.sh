#!/usr/bin/env bash
# Setup script for setting up a new macos machine
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

echo "Starting setup"

# install xcode CLI
xcode-select —-install


# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
    mas
    tree
    htop
    xonsh
    git
    readline
    pyenv
)
echo "Installing packages..."

brew install ${PACKAGES[@]}

# link readline
brew link --force readline

echo "Installing cask..."
CASKS=(
    iterm2
    slack
    visual-studio-code
    istat-menus
    private-internet-access
    bitwarden
    cheatsheet
    dropbox
    discord
    webcatalog
    brave-browser
    keka
    signal
)
echo "Installing cask apps..."
brew install ${CASKS[@]}

# Install mas apps
MAS=(          
    1107421413  # 1Blocker             
    1193539993  # Brother iPrint&Scan                                
    441258766   # Magnet
    1278508951  # Trello
    409201541   # Pages
    409203825   # Numbers
    1352778147  # Bitwarden
    1444383602  # GoodNotes
    )

echo "Intalling mas apps..."
mas install ${MAS[@]}

# Install Source Code Pro Font
echo "Installing font source code pro …"
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro

echo "Cleaning up..."
brew cleanup

echo "Macbook setup completed!"
