filetype plugin on
filetype indent on
set copyindent
set preserveindent
set shiftround
set history=700
set wildmenu
set wildmode=full
set wildignore+=**/.git/**,integration/mxit/frootball/awesome/*,*.png,*generated*,**/generated/**,*.o,**/node_modules/**,*.swp,*.class
set ignorecase
set incsearch
set showmatch
set path=$PWD/**
set noerrorbells
set novisualbell
syntax enable
"not supposed to be neccesary if terminfo is correct
"set t_Co=256
colorscheme gruvbox
set nobackup
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
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

set relativenumber
set number

set scrolloff=15

execute pathogen#infect()

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
