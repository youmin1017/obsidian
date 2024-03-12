[Starship](https://starship.rs/guide/#%F0%9F%9A%80-installation)

> [!INFO] The minimal, blazing-fast, and infinitely customizable prompt for any shell!
> 
>-   **Fast:** it's fast – _really really_ fast! 🚀
>-   **Customizable:** configure every aspect of your prompt.
>-   **Universal:** works on any shell, on any operating system.
>-   **Intelligent:** shows relevant information at a glance.
>-   **Feature rich:** support for all your favorite tools.
>-   **Easy:** quick to install – start using it in minutes.

## Installation

```bash
brew install starship
```

Add the following to the end of `~/.zshrc`:

```bash
eval "$(starship init zsh)"
```


## Configuration

```toml
# /Users/youmin/.config/starship.toml

# Get editor completions based on the config schema
"$schema" = 'https://starship.rs/config-schema.json'

# Inserts a blank line between shell prompts
add_newline = false

# Replace the "❯" symbol in the prompt with "➜"
[character] # The name of the module we are configuring is "character"
success_symbol = "[➜](bold green)" # The "success_symbol" segment is being set to "➜" with the color "bold green"
error_symbol = "[➜](bold red)" 

# Disable the package module, hiding it from the prompt completely
[package]
disabled = true
```