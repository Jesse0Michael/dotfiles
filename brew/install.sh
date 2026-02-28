
#!/usr/bin/env bash

# Abort on error
set -e

echo "Checking if Homebrew is already installed..."; 

# Checks if Homebrew is installed
# Credit: https://gist.github.com/codeinthehole/26b37efa67041e1307db
if test ! $(which brew); then
  echo "Installing Homebrew...";
  yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew is already installed...";
fi

# Install the essential brews
brew install gh
brew install git
brew install git-lfs
brew install jq  
brew install tmux 
brew install go  
brew install node
brew install golangci-lint 
brew install awscli
brew install terraform
brew install kubernetes-cli 
brew install kubectx 
brew install helm
brew install k9s
brew install buf 
brew install protobuf
brew install lsd
brew install tree
brew install zsh
brew install zsh-completions
brew install redis
brew install ffmpeg
brew install youtube-dl
brew install imagemagick

# Install essential casks
brew install --cask iterm2
brew install --cask gcloud-cli
brew install --cask claude-code
brew install --cask charles

# Update and Upgrade
echo "Updating and upgrading Homebrew..."; echo;
yes | brew update
yes | brew upgrade

# Remove outdated versions from the cellar
brew cleanup
