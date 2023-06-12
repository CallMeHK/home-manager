# home-manager
This is my nix home-manager config! Still a WIP, but its been a blast to configure. The purpose of this is to set up a minimal dev environment, terminal only, no GUI applications. NixGL works, but its a little goofy.

## Installation
The following programs are required for this home-manager config to install: `bash`, `git`, `chsh`, `curl`

Download the single-user install of the [standalone nix package manager](https://nixos.org/download.html) and source nix:
```
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```
Install [standalone home-manager](https://nix-community.github.io/home-manager/index.html#sec-install-standalone):
```
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```
Let home manager build your env:
```
home-manager switch
```

I will turn this into a script at some point, no reason for it to be copy pasta. 

## What does it install?
 - Neovim with 
  - Node and lua LSPs
  - Completion
  - Session Management
  - Nightfox theme
  - Treesitter and nvim-tree
  - Telescope, fzf
  - Remaps, tweaks, and other goodies
 - Some command line utils like yq, ripgrep
 - asdf for managing and languages
 - node installed via asdf
 - fish, set to default shell with an install hook

## Words of warning
I have run this on fedora. It will probably run fine on anything that has most programs installed at `/usr/bin` (normal linux stuff). 
I dont know if it would work on:
 - NixOS
 - OSX
 - WSL (probably would tho)
