imap jk <Esc>

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
" I like using H and L for beginning/end of line
nmap H ^
nmap L $
" Quickly remove search highlights
nmap <Esc> :nohl

" Yank to system clipboard
set clipboard=unnamed

" Go back and forward with Ctrl+O and Ctrl+I
" (make sure to remove default Obsidian shortcuts for these to work)
exmap back obcommand app:go-back
nmap <C-o> :back
exmap forward obcommand app:go-forward
nmap <C-i> :forward

nmap gh g0
nmap gl g$

nmap <expr>j v:count || mode(1)[0:1] == "no" ? "j" : "gj"
nmap <expr>k v:count || mode(1)[0:1] == "no" ? "k" : "gk"
