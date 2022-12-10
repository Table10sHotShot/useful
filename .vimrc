set nocompatible

filetype indent plugin on
syntax on

" Set colorscheme {{{
set background=dark
colorscheme solarized
" }}}

" Basic Settings {{{
let mapleader = ","

" Enable mouse
set mouse=a

" Default whitespace settings {{{
set shiftwidth=4
set tabstop=4
set expandtab
" }}}

" {{{ Turn on line numberings
set ruler
set number
set relativenumber
" }}}
" }}}

" Mappings {{{
" {{{ Sudo save
cmap w!! w !sudo tee > /dev/null %
" }}}

" {{{ Modify vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}

" Escape insert mode {{{
inoremap fd <esc>
inoremap ffd f<esc>
inoremap <esc> <nop>
" }}}

" Surround in quotes {{{
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
" }}}

" Replace with spaces {{{
nnoremap <leader><Space> viwr<Space>
" }}}

" Newlines normal {{{
nnoremap oo o<esc>
nnoremap OO O<esc>
" }}}

" Uppercase words {{{
inoremap <leader>u <esc>msviwU`sa
nnoremap <leader>u msviwU`s
" }}}

" Strong lateral movements {{{
nnoremap H 0
nnoremap L $
" }}}

" Splits {{{
nnoremap <leader>sH :aboveleft vsp 
nnoremap <leader>sJ :belowright sp 
nnoremap <leader>sK :aboveleft sp 
nnoremap <leader>sL :belowright vsp 
nnoremap <leader>sh <C-w>h
nnoremap <leader>sj <C-w>j
nnoremap <leader>sk <C-w>k
nnoremap <leader>sl <C-w>l
" }}}

" Tabs {{{
nnoremap <leader>tt :tabnew 
nnoremap <leader>th :tabprevious<cr>
nnoremap <leader>tl :tabnext<cr>
" }}}

" Operator-pending {{{
onoremap in( :<c-u>normal! f(vi(<cr>
" }}}

" Window movements {{{
nnoremap <c-h> <c-f>
nnoremap <c-j> <c-d>
nnoremap <c-k> <c-u>
nnoremap <c-l> <c-b>
" }}}

" Sudo save {{{
cnoremap w!! w !sudo tee > /dev/null %
" }}}
" }}}

" Abbrevs {{{

" Spelling auto-correct {{{
iabbrev teh the
iabbrev waht what
" }}}

" Signatures {{{
iabbrev @@ jalexvig@gmail.com
" }}}
" }}}
