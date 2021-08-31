#!/usr/bin/env bash
# Setup script for setting up a new macos machine
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

# VS Code themes: Tokyo Night, Ayu, FireFly Pro, One Dark Pro, Material Icon Theme


echo "Starting setup"

# install xcode CLI
#xcode-select —-install

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
    slack
    brave-browser
    visual-studio-code
    sublime-text
    istat-menus
    private-internet-access
    bitwarden
    cheatsheet
    dropbox
    discord
    keka
    signal
    rectangle
    keepingyouawake
    vorta
    irvue
    
)
echo "Installing packages..."

brew install ${PACKAGES[@]}

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

# Install Fonts
echo "Installing fonts fira and cascadian …"
brew install font-fira-code font-cascadia-code font-cascadia-mono

echo "Cleaning up..."
brew cleanup

echo "Macbook setup completed!"
