#!/usr/bin/env bash

# Abort on error
set -e

echo "Checking if Homebrew is already installed..."

if [[ ! -x /opt/homebrew/bin/brew ]]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is already installed..."
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Homebrew packages
brew install awscli
brew install buf
brew install exiftool
brew install fd
brew install ffmpeg
brew install ffmpegthumbnailer
brew install fzf
brew install gh
brew install git
brew install git-lfs
brew install go
brew install golangci-lint
brew install helm
brew install imagemagick
brew install jq
brew install k6
brew install k9s
brew install kubectx
brew install kubernetes-cli
brew install lsd
brew install node
brew install ollama
brew install opencode
brew install poppler
brew install protobuf
brew install redis
brew install ripgrep
brew install sqlite
brew install tmux
brew install tree
brew install yazi
# brew install youtube-dl
brew install zoxide
brew install zsh
brew install zsh-completions

# Install Homebrew applications
brew install --cask bruno
brew install --cask charles
brew install --cask claude-code
brew install --cask dbeaver-community
brew install --cask docker-desktop
brew install --cask gcloud-cli
brew install --cask ghostty
brew install --cask github
brew install --cask godot
brew install --cask google-chrome
brew install --cask postman
brew install --cask prusaslicer
brew install --cask slack
brew install --cask spotify
brew install --cask tailscale-app
brew install --cask tunnelblick
brew install --cask unity-hub
brew install --cask visual-studio-code
brew install --cask zed

# Install software from third-party taps
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Update and upgrade
echo "Updating and upgrading Homebrew..."
echo
yes | brew update
yes | brew upgrade

# Remove outdated versions from the cellar
brew cleanup
