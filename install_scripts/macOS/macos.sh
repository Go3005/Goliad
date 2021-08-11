#! /bin/bash

# ---------------------------------------------------------------------------------------------
#  Goliad OpenVPN Client
# MacOS Install Script
#  Creation Date: 08/11/2021
# Author: Jonathan Scott

if test ! "$(which brew)"; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew upgrade
brew install openvpn peco lynx
