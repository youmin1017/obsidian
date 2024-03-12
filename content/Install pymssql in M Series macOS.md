---
tags:
  - macOS
  - mssql
  - python
  - poetry
---


> [!INFO] Requirements
> * [brew](https://brew.sh/): macOS package manager
> * [pyenv](https://github.com/pyenv/pyenv): python environment manager
> * [poetry](https://python-poetry.org/): python project package manager

## Environment Setup

1. Install dependencies 

```bash
brew install unixodbc
brew install freetds
brew install openssl
brew install libiconv
```

2. Install python with pyenv
3. Change global python to previously installed one

```bash
# choice any version you prefer
PY_VERSION='3.10'
pyenv install $PY_VERSION
pyenv global $PY_VERSION
```

4. Create virtual env with poetry

```bash
poetry env use $PY_VERSION
```

5. Setup Compile Flags

```bash
export LDFLAGS="-L/opt/homebrew/opt/freetds/lib -L/opt/homebrew/opt/openssl@3/lib"
export CFLAGS="-I/opt/homebrew/opt/freetds/include"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
```

>  https://github.com/pymssql/pymssql/issues/727#issuecomment-1204850473

6. Install `pymssql` with poetry

```bash
poetry add pymssql
```