---
tags:
  - linux
---
## Dependencies

## For installing `Neovim` in almalinux

> [!NOTE] Note
> EPEL (Extra Packages for Enterprise Linux) (Almalinux)

```bash
sudo dnf install epel-release
```

**Git, Cur, Zshl**
```bash
sudo dnf install git curl zsh
```

**fzf**
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

**zoxide**
```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

**antidote**
```bash
git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-$HOME}/.antidote
```

**starship**
```bash
sudo dnf copr enable atim/starship
sudo dnf install starship
```

### Apply dotfiles

```shell
git clone https://github.com/youmin1017/dotfiles.git ~/.local/share/chezmoi
chezmoi init
chezmoi apply
```

### 2. Change Default Shell

```bash
chsh -s /bin/zsh
```