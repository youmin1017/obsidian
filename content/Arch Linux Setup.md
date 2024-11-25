---
tags:
  - linux
  - arch
---
	**	## Install AUR Helper

> [!NOTE] 
> For install packages easily

```shell
pacman -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

## Install Packages

```shell
yay chezmoi      # dotfiles manager 
yay neovim        
yay fzf           
yay zoxide
yay zsh           
yay starshipt    # zsh prompt 
yay zsh-antidote # zsh plugin manager
```
## Setup

### Apply dotfiles

```shell
git clone https://github.com/youmin1017/dotfiles.git ~/.local/share/chezmoi
chezmoi init
chezmoi apply
```

### Change default shell to zsh

```shell
chsh -s /bin/zsh
```
