colorscheme xoria256

filetype on
set mouse=
set expandtab
set shiftwidth=4
set tabstop=4
set autochdir
set ruler
set nowrap

nmap 's :source ~/.config/nvim/init.vim<cr>
nmap 'v :e! ~/.config/nvim/init.vim<cr>

nnoremap ,t :Nuake<CR>
inoremap ,t <C-\><C-n>:Nuake<CR>
tnoremap ,t <C-\><C-n>:Nuake<CR>

inoremap ,q <C-\><C-n>:NuakeLast<CR>
tnoremap ,q <C-\><C-n>:NuakeLast<CR>
nnoremap ,q :NuakeLast<CR>
let g:nuake_position = 'left'

set noeol "No automatically add a newline to modified files
noremap H H

nmap ,h :GitGutterLineHighlightsToggle<cr>

" Map Leader to <space><space>
" Then map the global clipboard to easier to use keys
let mapleader="  "
noremap <Leader>y "*y
noremap <Leader>p "*P

if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
function! SetVar()
    set filetype=make
endfunction
au BufReadPost * if getline(2) =~ "- Makefile -" | call SetVar() | endif

"autocmd FileType fzf silent! tunmap <Esc>

" Next/Previous Buffer
map <Tab> :bnext<cr>
map <S-Tab> :bprev<cr>

map ,e :FZ<cr>
map ,d :setl bufhidden=delete<Bar>bnext <cr>
map ,<space> zz
map `g :GFiles?<cr>
nmap `e :Buffers<cr>
map ,b :Buffers<cr>

" Remove the need to use ctrl-f and ctrl-u for page up page down navigation 
map ,f <C-f>
map ,u <C-u>
map ,o <C-o>
map ,O <C-o>
" Remove the need to use ctrl-v for columular selection
map ,v <C-v>

" Split window command + Navigation
nmap `1 1<C-W><C-W>
nmap `2 2<C-W><C-W>
nmap `3 3<C-W><C-W>
nmap `4 4<C-W><C-W>

nmap `t <C-W><C-V>:terminal<cr>
nmap `v <C-W><C-V>
nmap `s <C-W>s
nmap `c <C-W>c
nmap `h <C-W>h
nmap `j <C-W>j
nmap `k <C-W>k
nmap `l <C-W>l
nmap `bd :bp\|bd#<cr>

" Offload some of this to the right hand
" Split window command + Navigation
nmap +1 1<C-W><C-W>
nmap +2 2<C-W><C-W>
nmap +3 3<C-W><C-W>
nmap +4 4<C-W><C-W>

nmap +t <C-W><C-V>:terminal<cr>
nmap +v <C-W><C-V>
nmap +s <C-W>s
nmap +c <C-W>c
nmap +h <C-W>h
nmap +j <C-W>j
nmap +k <C-W>k
nmap +l <C-W>l
nmap +bd :bp\|bd#<cr>

nmap <Left> <C-W>h
nmap <Down> <C-W>j
nmap <Up> <C-W>k
nmap <Right> <C-W>l

nmap ') ysiw)
nmap `) ysiw)

"Disable EX mode
map Q <Nop>

" Show/Hide line numbers
nmap ,n :call ToggleNumbers()<cr>

" Enable spell check
nmap 'S :setlocal spell spelllang=en_us<cr>
nmap <Leader>s :setlocal spell spelllang=en_us<cr>
" Use 'z=' to show suggestions

" Enable spell check for Git Commits 
au FileType markdown,gitcommit setlocal spell spelllang=en_us

" Toggle NERD  Tree
nmap tt :NERDTreeToggle<cr>

" Terminal mappings
tnoremap <C-w> <C-\><C-n>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" Sneak options
let g:sneak#label = 1

" Now that we have sneak we can override () in visual mode
vmap ) S)


" ***** Plugins ****************************************************************
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ap/vim-buftabline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'                                 "File commands like Rename"
Plug 'tpope/vim-surround' "Surround a word with parens
Plug 'Lenovsky/nuake'
Plug 'justinmk/vim-sneak'
Plug 'will133/vim-dirdiff'
Plug 'kana/vim-textobj-user' " Helper script for vim-textobj-user   https://www.vim.org/scripts/script.php?script_id=2100
Plug 'kana/vim-textobj-line' " Help surround words with out newline https://www.vim.org/scripts/script.php?script_id=3886 
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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
" DirDiff Plugin Options """""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DirDiffExcludes = ".git,vendor"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
autocmd FileType go,make :set listchars=tab:\ \ ,trail:-,extends:>,precedes:<,nbsp:+
autocmd FileType go,make :set noexpandtab

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

function! ToggleNumbers()
    if &number == 0
        set number
    else
        set nonumber
    endif
endfunction


" Helper mappings: Go to opening brace of function
" https://vim.fandom.com/wiki/Jumping_to_the_start_and_end_of_a_code_block
map [[ :silent! eval search('{', 'b')<CR>w99[{
map ][ :silent! eval search('}')<CR>b99]}
map ]] j0[[%:silent! eval search('{')<CR>
map [] k$][%:silent! eval search('}', 'b')<CR>
