if $VisualStudioVersion == ""
    filetype plugin indent on
    let &packpath .= ',' .. expand('<sfile>:p:h') .. "/vimfiles"

    syntax on
    set ruler
    set enc=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf8,prc
    set autoread
    colorscheme nord

    " Status bar
    set laststatus=2
    set noshowmode
    let g:lightline = {
          \ 'colorscheme': 'nord',
          \ }

    " Indendation
    set smarttab
    set smartindent

    " C Language
    set cinoptions=(0,W4

    " Rust language
    let g:rustfmt_autosave = 1

    " GUI settings
    if has("gui_running")
        set guifont=Lucida_Console:h11
        set guioptions-=m
        set guioptions-=T
        set guioptions-=r
        set lines=50 columns=150
    endif
endif

set number
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" More ergonomic to-end-of-line for Finnish keyboard
nmap - $
vmap - $
omap - $

" Shortcuts for window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

