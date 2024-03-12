
## Setup Desktop in Ubuntu Server

```bash
sudo apt install ubuntu-desktop
```

## ToDo

- [x] Install [zoxide](https://github.com/ajeetdsouza/zoxide?tab=readme-ov-file) instead
## Setup Shell and Prompt

### 1. Install Dependencies `pacstall`, `build-essential`, etc

> [!INFO] [Pacstall](https://github.com/pacstall/pacstall#installing)
> An AUR-inspired package manager for Ubuntu
> ```bash
> sudo bash -c "$(curl -fsSL https://pacstall.dev/q/install || wget -q https://pacstall.dev/q/install -O -)"
> ```

```bash
# install dependencies, zsh, fzf, starship, etc.
sudo apt install zsh fzf build-essential
pacstall -I cmake-deb
```


### 2. Change Default Shell

```bash
chsh -s /bin/zsh
```

### 3. Helix (Editor) (Optional)

```bash
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix
```
> Setup [[Helix]]

### 4. Setup Rust Environment 

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### 5. Starship (shell prompt)

> [!Warning]
> Since using `snap` to install starship the `~/.config/starship.toml` won't work, so here using `cargo` instead.

```bash
# use cargo instead of snap
cargo install starship --locked
```

> [[Starship]] Configuration is inside this article

### 6. Zoxide (autojump like)

```bash
cargo install zoxide --locked
# or
pacstall -I zoxide-deb
```

### 7. Zinit (zsh plugin manager)

```bash
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```
> install zinit

### 8. ZshRC

> [!INFO] INFO
> Make colors to work properly in Helix editor by setting
>  > COLORTERM=truecolor
> 
> [link](https://askubuntu.com/a/1329392)

```bash
export COLORTERM=truecolor

setopt autocd
setopt inc_append_history

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias ls='ls --color=auto'

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})\u2026%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zi light Aloxaf/fzf-tab
zi light zsh-users/zsh-completions
zi light zsh-users/zsh-autosuggestions
zi light zsh-users/zsh-syntax-highlighting

# zsh-vi-mode configs
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_KEYTIMEOUT=0.03
}
function zvm_after_init() {
  # for fzf
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
}
zi ice depth=1
zi light jeffreytse/zsh-vi-mode


eval "$(zoxide init --cmd j zsh)"
eval "$(starship init zsh)"
```


## Completion

[Setup completion](https://www.reddit.com/r/zsh/comments/mvjbn4/no_autocompletion_with_zsh_for_docker/)
## Softwares (Optional)

```bash
sudo snap install node --classic  #nodejs
```

> [!TODO]
> *  [[Neovim]] 
