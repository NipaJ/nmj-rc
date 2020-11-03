filetype plugin indent on

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" Visual settings
if has("gui_running")
	colorscheme desert
	set guifont=Courier_New:h8
	set guioptions-=m
	set guioptions-=T
	set guioptions-=r
	set lines=63 columns=250
endif

" Misc configs
syntax on
set number
set ruler

" Tab configs
set autoindent
set expandtab
set smarttab
set smartindent
set tabstop=4
set shiftwidth=4

" C configs
set cinoptions=(0,W4

" Enable autoread
set autoread

" Map $ to -
nmap - $
vmap - $
omap - $

" Control window movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

