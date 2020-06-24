noremap H H
set mouse=
set expandtab
set shiftwidth=4
set tabstop=4
set autochdir
set ruler
set nowrap

nmap 's :source ~/.config/nvim/init.vim<cr>
nmap 'v :e! ~/.config/nvim/init.vim<cr>

nmap ,h :GitGutterLineHighlightsToggle<cr>
nmap ,bd :bp\|bd#<cr>
colorscheme xoria256


set backspace=indent,eol,start

if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif

" Next/Previous Buffer
map <Tab> :bnext<cr>
map <S-Tab> :bprev<cr>

map ,e :FZ<cr>
map ,g :GFiles?<cr>
map ,d :setl bufhidden=delete<Bar>bnext <cr>
map ,<space> zz

" Remove the need to use ctrl-f and ctrl-u for page up page down navigation 
map ,f <C-f>
map ,u <C-u>
map ,o <C-o>
map ,O <C-o>
" Remove the need to use ctrl-v for columular selection
map ,v <C-v>

" Split window command + Navigation
map `t <C-W><C-V>:terminal<cr>
map `v <C-W><C-V>
map `s <C-W>s
map `c <C-W>c
map `h <C-W>h
map `j <C-W>j
map `k <C-W>k
map `l <C-W>l

" Show/Hide line numbers
nmap ,n :set number<cr>
nmap ,N :set nonumber<cr>

" Enable spell check
nmap ss :setlocal spell spelllang=en_us<cr>
" Use 'z=' to show suggesstions

" Enable spell check for gitcommits 
au FileType markdown,gitcommit setlocal spell spelllang=en_us

" Toggle NERD  Tree
nmap tt :NERDTreeToggle<cr>

" Don't automatically add a newline to modified files
set noeol

" Terminal mappings
tnoremap <C-w> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n>


" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
"Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-eunuch'

let g:buftabline_separators = 1
let g:buftabline_indicators = 1
let g:buftabline_numbers = 1

" Faster update time for git-gutter?
set updatetime=25

" Initialize plugin system
call plug#end()

" Run Neomake on writes
"autocmd! BufWritePost * Neomake
" Debug Neomake
"let g:neomake_verbose=3 
" Write neomake to a log file
"let g:neomake_logfile='/tmp/error.log'

" Plugin Options """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \     'left': [ ['mode', 'paste' ], [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \ 'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
      \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Diff Section""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Next/Previous diff section
map <C-j> ]czz
map <C-k> [czz

map <down> ]czz
map <up> [czz

" Ignore/Don't Ignore white spaces in diffs"""""""""""""""""""""""""""""""""""""
command! WS  call s:WSOn()
function! s:WSOn() 
et
endfunction
command! NWS call s:WSOff()
function! s:WSOff()
    set diffopt+=iwhite
endfunction

"function! DiffTo
"  let g:gitgutter_diff_base = ''
"endfunction

" Diff current buffers
command! SetDiff call SetDiffEnviron()
function! SetDiffEnviron()
    set diff
    set scrollbind
    set scrollopt=ver,jump,hor
    set nowrap
    set fdm=diff
endfunction
set encoding=utf-8
set list listchars=tab:→\ ,trail:·

if &diff
    colorscheme xoria256
    set diffopt=filler,context:1000000 " filler is default and inserts empty lines for sync
    " set diffopt+=iwhite              " Ignore white space
else
     set diffopt=filler,vertical,context:1000000 " filler is default and inserts empty lines for sync
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Examples
"let g:gitgutter_diff_base = '<commit SHA>'


command! FZ call RunFZFromRoot()
function! RunFZFromRoot()
    let CWD=getcwd()
    let ROOT=system("git rev-parse --show-toplevel")
    execute 'cd' ROOT
    execute 'FZF'

    "let NWD=substitute(CWD, '^\(.*\/Android\/\).*', '\1', "")
    "if CWD == NWD 
    "    echo "Not in an Android directory"
    "endif
endfunction

nnoremap ,m :call TestMaximizeToggle()<CR>

function! TestMaximizeToggle()
  if exists("g:maximize_session")
      unlet g:maximize_session
      echom "Closing down maximized session"
      tabclose
  else
      let g:maximize_session = tempname()
      echom "Maximizing session"
      tabedit %
  endif
endfunction

" Deprecated
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction
"set nowritebackup
"set nobackup
"set noswapfile


"cmap H H
"imap H H
"cmap L L
"imap L L

