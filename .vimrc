filetype plugin on
filetype indent on
set copyindent
set preserveindent
set shiftround
set history=700
set wildmenu
set wildmode=full
set wildignore+=**/.git/**,integration/mxit/frootball/awesome/*,*.png,*generated*,**/generated/**,*.o,**/node_modules/**,*.swp,*.class,**/bower/**
set ignorecase
set incsearch
set showmatch
set path=$PWD/**
"set path+=**
set noerrorbells
set novisualbell
syntax enable
"not supposed to be neccesary if terminfo is correct
"set t_Co=256
set nobackup
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
let g:js_indent_log = 1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set nocompatible
"set timeoutlen=100
set showcmd
set hlsearch
set nohidden

"set backup
"set backup=/home/nicok/.vim/backup
"set directory=/home/nicok/.vim/tmp

set scrolloff=5
set sidescrolloff=5
set history=500

set paste
set ai
set si

set number

set scrolloff=15

colorscheme gruvbox

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" the command for this is "Ag" - opens search results in quickfix window
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" ctrl-s
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>l
vnoremap <c-s> <Esc>:w<CR>


" ctags
command! MakeTags !ctags -R .

" show tabs
set listchars=tab:>-
set list

" stupd syntax highlighting
"map <c-s> :syntax sync fromstart<CR>

".vimrc
map <c-s> :call JsBeautify()<cr>

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab

set et
set tabstop=2
set shiftwidth=2

nnoremap gp :silent %!prettier --stdin --trailing-comma all --single-quote<CR>
" trailing stuff
match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'

nnoremap - :Explore<CR>

let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
"let g:netrw_liststyle     = 2
"let g:netrw_retmap        = 1
let g:netrw_silent        = 1
"let g:netrw_special_syntax= 1
let g:netrw_banner=0
autocmd FileType vue syntax sync fromstart
"let g:vue_disable_pre_processors=1
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.pug
execute pathogen#infect()







call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'leafgarland/typescript-vim'
" Required for operations modifying multiple buffers like rename.
set hidden

"    \ 'javascript': ['javascript-typescript-stdio'],
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['tcp://127.0.0.1:2089'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_completion()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
