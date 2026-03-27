#!/usr/bin/env bash

# Early macOS setup — sourced by bootstrap.sh before anything that needs git.

install_xcode_tools () {
  if ! xcode-select -p &>/dev/null; then
    info 'installing Xcode Command Line Tools...'
    xcode-select --install
    info 'waiting for Xcode Command Line Tools to finish (complete the dialog)...'
    until xcode-select -p &>/dev/null; do
      sleep 5
    done
    success 'Xcode Command Line Tools installed'
  else
    success 'Xcode Command Line Tools already installed'
  fi
}

install_xcode_tools
