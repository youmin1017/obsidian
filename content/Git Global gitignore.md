## Setup

### Create .gitignore file and set it as global gitignore file

```bash
touch ~/.gitgnore
git config --global core.excludesFile ~/.gitignore
```

### Edit .gitignore to ignore what you want

```gitignore
 # .gitignore_global

# Numerous always-ignore extensions
*.diff
*.err
*.log
*.orig
*.rej
*.swo
*.swp
*.vi
*~

# Packages 
*.7z
*.dmg
*.gz
*.iso
*.jar
*.rar
*.tar
*.zip

# OS or Editor folders
._*
.cache
.idea
.project
.settings
.tmproj
*.esproj
*.sublime-project
*.sublime-workspace
nbproject
Thumbs.db
ehthumbs.db
.DS_Store
.DS_Store?
.Spotlight-V100
.Trashes
*.swp
._*

# Folders to ignore
node_modules
```

## Reference

* [[筆記] Git 忽略 .DS_Store 等排除檔案 @地瓜大的飛翔旅程 (smlpoints.com)](https://smlpoints.com/notes-git-ignore-ds_store-files-and-so-on-gitignore.html)