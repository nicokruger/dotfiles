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
"set backup=/Users/nicok/.vim/tmp
set directory=/Users/nicok/.vim/tmp

set scrolloff=5
set sidescrolloff=5
set history=500

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
map <c-s> :syntax sync fromstart<CR>

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
autocmd BufReadPost,BufNewFile *.vue setlocal filetype=vue
"let g:vue_disable_pre_processors=1
"autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.pug
execute pathogen#infect()







call plug#begin()
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Required for operations modifying multiple buffers like rename.
set hidden

"    \ 'javascript': ['javascript-typescript-stdio'],
"let g:LanguageClient_serverCommands = {
"    \ 'javascript': ['tcp://127.0.0.1:2089'],
"    \ }

"nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"" Or map each action separately
""nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> K :call LanguageClient#textDocument_completion()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>













" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
