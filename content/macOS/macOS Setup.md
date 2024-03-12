## Copy and Paste In CLI

* Copy: `pbcopy`
* Paste: `pbpaste`
 
## Enable Key-Repeating

```bash
defaults write com.microsoft.edgemac ApplePressAndHoldEnabled -bool false # For Edge
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false  # For VS Code
```

## Scroll to open dock folder

```bash
defaults write com.apple.dock scroll-to-open -bool TRUE; killall Dock
```

> [!NOTE] Reference
> https://www.imore.com/how-use-scroll-gestures-your-macs-dock


## Terminal Setup

### Terminal Emulators

- [[Kitty]]
- [[WezTerm]] (ToDo)

### Prompts

- [[Starship]]

> [!INFO]
> **The minimal, blazing-fast, and infinitely customizable prompt for any shell!**
> - **Fast:** it's fast – _really really_ fast! 🚀
> -   **Customizable:** configure every aspect of your prompt.
> -   **Universal:** works on any shell, on any operating system.
> -   **Intelligent:** shows relevant information at a glance.
> -   **Feature rich:** support for all your favorite tools.
> -   **Easy:** quick to install – start using it in minutes.

## Tools

- 使用 [[Trash]]  來避免使用`rm`，`rm`會永久刪除檔案。