# dotfiles

Jesse's personal dotfiles. Sets up a new Mac with one command.

## New Mac setup

```sh
git clone https://github.com/jesse0michael/dotfiles ~/dotfiles
cd ~/dotfiles/installers
./bootstrap.sh
```

This will:
1. Install oh-my-zsh
2. Symlink all config files into `~` (zshrc, gitconfig, zprofile)
3. Apply macOS settings
4. Install Homebrew + packages

## Machine-local config

Anything you don't want committed (work email, AWS profile, private env vars) goes in local override files that are gitignored:

| File | Purpose |
|------|---------|
| `~/.zshrc.local` | Work aliases, extra PATH entries, private env vars |
| `~/.gitconfig.local` | Work email, signing key overrides |
| `~/.zprofile.local` | AWS profile, cloud credentials |

Example `~/.gitconfig.local` for a work machine:

```ini
[user]
    email = jesse@company.com
```

## Structure

```
dotfiles/
├── bin/          ← scripts in PATH (gfix, gmend, gebase, docker-port, dot)
├── brew/         ← Homebrew packages
├── git/          ← gitconfig.symlink → ~/.gitconfig
├── installers/   ← bootstrap.sh (run this), install.sh
├── macos/        ← macOS system settings
└── zsh/          ← zshrc.symlink → ~/.zshrc
                    zprofile.symlink → ~/.zprofile
                    aliases
```

## Updating an existing machine

Re-run bootstrap anytime to re-link files and update packages:

```sh
cd ~/dotfiles/installers && ./bootstrap.sh
```
