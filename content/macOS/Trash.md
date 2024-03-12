---
tags:
  - macOS
---

# Using trash to prevent data from removing permanently

## Installation

```bash
brew install trash
```

## Setup

**避免使用`rm`**

>ShellJS is a portable (Windows/Linux/OS X) implementation of Unix shell commands on top of the Node.js API. You can use it to eliminate your shell script's dependency on Unix while still keeping its familiar and powerful commands. You can also install it globally so you can run it from outside Node projects - say goodbye to those gnarly Bash scripts!

```bash
alias rm='trash -F'
```