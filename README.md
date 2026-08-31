# dotfiles

Jesse's personal dotfiles for setting up a new Mac.

## New Mac setup

Install Apple's Command Line Tools:

```sh
xcode-select --install
```

After the installation finishes:

```sh
mkdir -p ~/code/github.com/jesse0michael
mkdir -p ~/.ssh
git clone https://github.com/Jesse0Michael/dotfiles.git ~/code/github.com/jesse0michael/dotfiles
cd ~/code/github.com/jesse0michael/dotfiles/installers
./bootstrap.sh
```

This will:

1. Set up an SSH key
2. Install oh-my-zsh
3. Symlink config files into `~`
4. Apply macOS settings
5. Install Homebrew, packages, and applications

## Machine-local config

Anything you don't want committed—work email, AWS profile, or private environment variables—goes in local override files:

| File                 | Purpose                                                             |
| -------------------- | ------------------------------------------------------------------- |
| `~/.zshrc.local`     | Work aliases, extra PATH entries, and private environment variables |
| `~/.gitconfig.local` | Work email and signing-key overrides                                |
| `~/.zprofile.local`  | AWS profile and cloud configuration                                 |

Example `~/.gitconfig.local`:

```ini
[user]
    email = jesse@company.com
```

## Structure

```text
dotfiles/
├── bin/          ← scripts in PATH
├── brew/         ← Homebrew packages and applications
├── config/       ← application configuration
├── git/          ← gitconfig.symlink → ~/.gitconfig
├── installers/   ← bootstrap.sh and install.sh
├── macos/        ← macOS system settings
└── zsh/          ← zshrc, zprofile, and aliases
```

## Updating an existing machine

```sh
cd ~/code/github.com/jesse0michael/dotfiles
git pull
cd installers
./bootstrap.sh
```
