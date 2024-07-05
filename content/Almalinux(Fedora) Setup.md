---
tags:
  - linux
---
## Dependencies

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