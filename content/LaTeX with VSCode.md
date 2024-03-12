---
draft: false
tags:
  - LaTex
  - VSCode
---
# $\LaTeX$

## 環境設定

1. Install [TinyTeX](https://yihui.org/tinytex) or [MiKTeX](https://miktex.org/)
2. Install Latex Workshop in VSCode
3. Follow https://github.com/James-Yu/LaTeX-Workshop/wiki/Install and set PATH environment variable
4. 設定 VSCode

> [!NOTE] Modify the path to your environment path is

```json
// settings.json
// 編譯順序會依照這裡所設定的recipes
"latex-workshop.latex.recipes": [
	{
	  "name": "xe->bib->xe->xe",
	  "tools": ["xelatex", "bibtex", "xelatex", "xelatex"]
	},
	{
	  "name": "xelatex",
	  "tools": ["xelatex"]
	},
	],
"latex-workshop.latex.tools": [
	{
	  "name": "xelatex",
	  "command": "/opt/homebrew/bin/xelatex",
	  "args": [
		"-synctex=1",
		"-interaction=nonstopmode",
		"-shell-escape",
		"%DOC%.tex"
	  ]
	},
	{
	  "name": "pdflatex",
	  "command": "/opt/homebrew/bin/pdflatex",
	  "args": [
		"-synctex=1",
		"-interaction=nonstopmode",
		"-file-line-error",
		"%DOC%"
	  ]
	},
	{
	  "name": "bibtex",
	  "command": "/opt/homebrew/bin/bibtex",
	  "args": ["%DOCFILE%"]
	}
]
```
## 設定中文字體


> [!INFO] INFO
> * Download [Noto Serif TC Font](https://fonts.google.com/noto/specimen/Noto+Serif?noto.query=noto+serif)
> * Download Subset [Noto CJK](https://github.com/notofonts/noto-cjk)

```latex
\documentclass[12pt,a4paper]{article}

% xeCJK
\usepackage[]{xeCJK}  % 中日韓字體套件
\usepackage{fontspec} % 讓latex可以使用系統字體
\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setmonofont{Times New Roman}

% 新增補充字
\xeCJKDeclareSubCJKBlock{SIP}{
    "73C9 -> "73C9, % 珉
}
\setCJKmainfont[]{Noto Serif TC}
\setCJKmainfont[SIP, Path=fonts/]{NotoSerifTC-Regular-Subset.otf}
\setCJKmonofont[]{Noto Serif TC}
```
> [Ref](https://tex.stackexchange.com/questions/174600/why-doesnt-my-chinese-character-display-properly)

## 設定參考文獻

```latex
\usepackage[backend=bibtex,sorting=nty]{biblatex}
\addbibresource{ref.bib}

% Content...

\pagebreak         % new page
\printbibliography % show references
```

## Other Packages

```latex
% Set image path
\usepackage{graphicx}    % used to insert image
\graphicspath{{images/}} % image path

\usepackage[margin=2cm]{geometry} % set margin, top right, bottom, left
\usepackage{setspace} % 用於設定行高
\onehalfspacing       % 行高

\usepackage{float} % used to fixed place not floating
\usepackage{url}   % url reference
```
