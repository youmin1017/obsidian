
> [!INFO] A post-modern **text editor**.

## Installation

https://docs.helix-editor.com/install.html

## Configuration

### config.toml

```toml
theme = "dark_plus"

[editor.cursor-shape]
insert = "bar"
normal = "block"
select = "block"

[editor.statusline]
separator = "│"
mode.normal = "NORMAL"
mode.insert = "INSERT"
mode.select = "SELECT"

[keys.normal]
C-e = ["align_view_bottom", "move_line_down" ]
C-y = ["align_view_top", "move_line_up" ]
A-j = [ "keep_primary_selection", "move_line_down", "extend_to_line_bounds", "extend_line_above", "split_selection_on_newline", "select_mode", "goto_line_end_newline", "normal_mode", "rotate_selection_contents_forward", "keep_primary_selection", "move_line_down" ]
A-k = [ "keep_primary_selection", "extend_to_line_bounds", "extend_line_above", "split_selection_on_newline", "select_mode", "goto_line_end_newline", "normal_mode", "rotate_selection_contents_forward", "keep_primary_selection" ]
D = ["ensure_selections_forward", "extend_to_line_end", "delete_selection"]

[keys.insert.j]
k = "normal_mode" # Maps `jk` to exit insert mode

[keys.insert]
C-s = "completion"
C-x = "commit_undo_c
```

### language.toml

```toml
[[language]]
name = "lua"
auto-format = true
```