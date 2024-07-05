---
tags:
  - bash
---
```bash
ask() {
  declare -n _ask_var=$2
  local _ask_answer
  while true; do
    read -p "$1 [Y/n/a] " _ask_answer
    case "${_ask_answer,,}" in
      y|yes|"" ) _ask_var="true" ; break; ;;
      n|no     ) _ask_var="false"; break; ;;
      a|abort  ) exit 1; ;;
    esac
  done
}

ask "Are you happy?" answer
if "$answer"; then echo "Yay! Me too!"; fi
```

> [!INFO] 
> https://stackoverflow.com/a/65213691
