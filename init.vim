colorscheme xoria256

set mouse=
set expandtab
set shiftwidth=4
set autochdir
set ruler
set nowrap
set backspace=indent,eol,start
set noeol "No automatically add a newline to modified files

noremap H H
nmap ,s :source ~/.config/nvim/init.vim
nmap ,v :e! ~/.config/nvim/init.vim<cr>
nmap ,h :GitGutterLineHighlightsToggle<cr>
nmap ,bd :bp\|bd#<cr>

" Map Leader to <space><space>
" Then map the global clipboard to easier to use keys
let mapleader="  "
noremap <Leader>y "*y
noremap <Leader>p "*P

" Next/Previous Buffer
map <C-l> :bnext<cr>
map <C-h> :bprev<cr>
map <Tab> :bnext<cr>
map <S-Tab> :bprev<cr>

map ,e :FZ<cr>
map ,g :GFiles?<cr>
map ,d :setl bufhidden=delete<Bar>bnext <cr>
map ,<space> zz
map `h <C-W>h
map `l <C-W>l
"Disable EX mode
map Q <Nop>

" Show/Hide line numbers
nmap ,n :call ToggleNumbers()<cr>

" Enable spell check
nmap ss :setlocal spell spelllang=en_us<cr>
nmap <Leader>s :setlocal spell spelllang=en_us<cr>
" Use 'z=' to show suggestions

" Enable spell check for Git Commits 
au FileType markdown,gitcommit setlocal spell spelllang=en_us

" Toggle NERD  Tree
nmap tt :NERDTreeToggle<cr>

" Terminal mappings
tnoremap <C-w> <C-\><C-n>
tnoremap <Esc><Esc> <C-\><C-n>


" ***** Plugins ****************************************************************
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-eunuch'
" Initialize plugin system
call plug#end()
" ***** /Plugins ***************************************************************



" Plugin Options """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Faster update time for git-gutter?
set updatetime=25
let g:buftabline_separators = 1
let g:buftabline_indicators = 1
let g:buftabline_numbers = 1

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

nnoremap ,o :call MaximizeToggle()<CR>

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

function! ToggleNumbers()
    if &number == 0
        set number
    else
        set nonumber
    endif
endfunction
