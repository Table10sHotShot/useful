runtime! debian.vim
set nocompatible

" Vundle settings {{{ 
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Valloric/YouCompleteMe'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/syntastic'
Bundle 'Raimondi/delimitMate'
Bundle 'pangloss/vim-javascript'
Bundle 'Rykka/riv.vim'
Bundle 'JamshedVesuna/vim-markdown-preview'
Bundle 'file:///Users/alex/projects/rust.vim'
" Bundle 'vim-latex/vim-latex'

Bundle 'mattn/emmet-vim'

" Bundle 'klen/python-mode'
" }}}

filetype indent plugin on
syntax on

" Set colorscheme {{{
colorscheme molokai
set t_Co=256
" }}}

" Basic Settings {{{
let mapleader = ","

" Enable mouse
set mouse=a

set relativenumber

" Default whitespace settings {{{
set shiftwidth=4
set tabstop=4
set expandtab
" }}}

" {{{ Turn on line numberings
set ruler
set nu
" }}}
" }}}

" Mappings {{{
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

" Note: localleader is \ by default
" Python file settings {{{
augroup filetype_python
	autocmd!
	autocmd FileType python nnoremap <buffer> <leader>c I# <esc>
	autocmd FileType python iabbrev <buffer> inm if __name__ == '__main__':<cr>
	autocmd FileType python nnoremap <buffer> <leader>ds :call DocString()<cr>
augroup END
" }}}

" C file settings {{{
augroup filetype_c
	autocmd!
    autocmd FileType c setlocal shiftwidth=4
augroup END
" }}}

" CPP file settings {{{
augroup filetype_cc
	autocmd!
    autocmd FileType cc setlocal shiftwidth=4
augroup END
" }}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" HTML file settings {{{
augroup filetype_html
    autocmd!
    autocmd FileType html setlocal shiftwidth=2
    autocmd FileType html setlocal tabstop=2
    autocmd FileType html iabbrev <buffer> scriptajs <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
    autocmd FileType html iabbrev <buffer> scriptbs <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
augroup END
" }}}

" Javascript file settings {{{
augroup filetype_js
    autocmd!
    autocmd FileType html setlocal shiftwidth=2
    autocmd FileType html setlocal tabstop=2
augroup END
" }}}

" Latex file settings {{{
let g:tex_flavor='latex'
" }}}

" Python-mode settings {{{
" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

" This does not work for some reason
" let g:pymode_python = 'python3'

" Using YouCompleteMe instead since it seems to be faster
let g:pymode_rope = 0

" Indentation
let g:pymode_indent = 1

" Documentation
let g:pymode_doc = 0
" let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
" }}}

" UltiSnips settings {{{
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
" }}}

" YCM settings {{{
nnoremap <leader>jd :YcmCompleter GoTo<CR>

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
" }}}

" Syntastic settings {{{
let g:syntastic_javascript_checkers = ['jshint']
" }}}
"
" NERDTree settings {{{
nnoremap <leader>ne :NERDTreeToggle<CR>
" }}}

" NerdCommenter settings {{{
let NERDSpaceDelims=1
nnoremap <leader>td OTODO(jalex): <esc>:call NERDComment(0, "invert")<CR>A
inoremap <leader>c <esc>:call NERDComment(0, "invert")<CR>A
" }}}

" Rust plugin settings {{{
let g:rustfmt_autosave = 1
" }}}
