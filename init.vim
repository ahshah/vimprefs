set termguicolors
colorscheme xoria256

filetype on
set mouse=
set expandtab
set shiftwidth=4
set tabstop=4
" Some how stopped working
set autochdir
"autocmd BufEnter * silent! lcd %:p:h

set ruler
set nowrap

nmap 's :source ~/.config/nvim/init.vim<cr>
nmap 'v :e! ~/.config/nvim/init.vim<cr>

nnoremap ,t :Nuake<CR>
inoremap ,t <C-\><C-n>:Nuake<CR>
tnoremap ,t <C-\><C-n>:Nuake<CR>

nnoremap ,<esc> :NuakeSwap<CR>
tnoremap ,<esc> <C-\><C-n>:NuakeSwap<CR>

inoremap ,q <C-\><C-n>:NuakeLast<CR>
tnoremap ,q <C-\><C-n>:NuakeLast<CR>
nnoremap ,q :NuakeLast<CR>
tnoremap <Esc><Esc> <C-\><C-n>
let g:nuake_position = 'left'

set noeol "No automatically add a newline to modified files
noremap H H

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
map <Tab> :tabnext<cr>
map <S-Tab> :tabprev<cr>

map ,e :FZ<cr>
map ,g :GFiles?<cr>
map `d :setl bufhidden=delete<Bar>bnext <cr>
map ,d :setl bufhidden=delete<Bar>bnext <cr>
map ,<space> zz
nmap `e :Buffers<cr>
map ,b :Buffers<cr>

" Remove the need to use ctrl-f and ctrl-u for page up page down navigation
map ,f <C-f>
map ,u <C-u>
map ,o <C-o>
map ,O <C-o>
" Remove the need to use ctrl-v for columular selection
map ,v <C-v>


" Take wrapped lines combine them into one line, and then re-wrap, useful when
" writing docs
vmap ,r Jgqq·

" Split window command + Navigation
nmap `q 1<C-W><C-W>
nmap `w 2<C-W><C-W>
nmap `e 3<C-W><C-W>
nmap `r 4<C-W><C-W>

"nmap `r <C-W><C-V>:terminal<cr>
nmap `t :tabnew<cr>
nmap `v <C-W><C-V>
nmap `s <C-W>s
nmap `c <C-W>c
nmap `h <C-W>h
nmap `j <C-W>j
nmap `k <C-W>k
nmap `l <C-W>l
nmap `bd :bp\|bd#<cr>

"terminal causes some really weird interactions with fzf so disable it for now
"nmap `r :wincmd v<cr>:terminal<cr>
"nnoremap <nowait> `v :wincmd v<cr>
"nnoremap <nowait> `c :wincmd c<cr>
"nnoremap <nowait> `h :wincmd h<cr>
"nnoremap <nowait> `j :wincmd j<cr>
"nnoremap `k :wincmd k<cr>
"nnoremap `l :wincmd l<cr>
"set notimeout
"
nnoremap ` <Nop>
nnoremap `h <C-w>h
nnoremap <nowait>`j <C-w>j
nnoremap <nowait>`k <C-w>k
nnoremap <nowait>`l <C-w>l
nnoremap <nowait>`v <C-w>v
nnoremap <nowait>`c :close<CR>




"nmap )r :wincmd v<cr>:terminal<cr>
nmap )v :wincmd v<cr>
nmap )c :wincmd c<cr>
nmap )h :wincmd h<cr>
nmap )j :wincmd j<cr>
nmap )k :wincmd k<cr>
nmap )l :wincmd l<cr>

" Disable C-w as its confusing
"nmap <C-w> <C-\>

" Offload some of this to the right hand
" Split window command + Navigation
nmap +1 1<C-W><C-W>
nmap +2 2<C-W><C-W>
nmap +3 3<C-W><C-W>
nmap +4 4<C-W><C-W>

"nmap +r <C-W><C-V>:terminal<cr>
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

"Toggle paste/nopaste
nmap `p :call TogglePaste()<cr>

" Enable spell check
nmap 'S :setlocal spell spelllang=en_us<cr>
nmap <Leader>s :setlocal spell spelllang=en_us<cr>
" Use 'z=' to show suggestions

" Enable spell check for Git Commits
au FileType markdown,gitcommit setlocal spell spelllang=en_us

" Toggle NERD  Tree
nmap tt :NERDTreeToggle<cr>

" Sneak options
let g:sneak#label = 1

" Now that we have sneak we can override () in visual mode
vmap ) S)


let g:gitgutter_map_keys = 0
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
"Plug 'ap/vim-buftabline'
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
Plug 'Shougo/deoplete.nvim'
Plug 'dense-analysis/ale' " Automatic linting for Python3
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-pack/nvim-spectre'
Plug 'folke/trouble.nvim'


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

nmap ,d :GitGutterLineHighlightsToggle<cr>
nmap ,G :GitGutterSignsToggle<cr>

" Next/Previous diff section
map <C-j> ]czz
map <C-k> [czz

map <down> ]czz
map <up> [czz

nnoremap <expr> <C-j> &diff ? ']czz' : ':GitGutterNextHunk<cr>'
nnoremap <expr> <C-k> &diff ? '[czz' : ':GitGutterPrevHunk<cr>'


" Ignore/Don't Ignore white spaces in diffs"""""""""""""""""""""""""""""""""""""
command! WS  call s:WSOn()
function! s:WSOn()
    set diffopt-=iwhite
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

"set list listchars=tab:→\ ,trail:·
"autocmd FileType go,make :set listchars=tab:\ \ ,trail:-,extends:>,precedes:<,nbsp:+
"autocmd FileType go,make :set noexpandtab


"autocmd!
autocmd BufEnter,FileType * call SetListcharsUnlessGo()
"autocmd BufEnter * call SetListcharsUnlessGo()

function! SetListcharsUnlessGo() abort
  if &filetype ==# 'go' || &filetype ==# 'make'
    setlocal list listchars=tab:\ \ ,trail:-,extends:>,precedes:<,nbsp:+
    setlocal noexpandtab
  else
    setlocal list listchars=tab:→\ ,trail:·
  endif
endfunction


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

" FZF does not close ,e dialog via escape in nvim
autocmd FileType fzf tnoremap <buffer> <Esc><Esc> <C-c>
autocmd FileType fzf tnoremap <buffer> ,e <C-c>
autocmd FileType fzf tnoremap <buffer> ,b <C-c>

nnoremap ,m :call TestMaximizeToggle()<CR>

function! TestMaximizeToggle()
  if exists("g:maximize_session")
      unlet g:maximize_session
      echom "Closing down maximized session"
      tabclose
  else
      let g:maximize_lnum = line('.')
      let g:maximize_cnum = col('.')
      let g:maximize_session = tempname()

      echom "Maximizing session"
      tabedit %
      call cursor(g:maximize_lnum, g:maximize_cnum)
  endif
endfunction



function! MoveAndClose()
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

function! TogglePaste()
    if &paste == 0
        set paste
    else
        set nopaste
    endif
endfunction



" Helper mappings: Go to opening brace of function
" https://vim.fandom.com/wiki/Jumping_to_the_start_and_end_of_a_code_block
map [[ :silent! eval search('{', 'b')<CR>w99[{
map ][ :silent! eval search('}')<CR>b99]}
map ]] j0[[%:silent! eval search('{')<CR>
map [] k$][%:silent! eval search('}', 'b')<CR>

nnoremap ,. :call GoToPrevClosingBracket()<CR>i
function! GoToPrevClosingBracket()
    "let cur_char = getline('.')
    "let cur_char = substr(cur_char, col('.') - 1, 1)
    let cur_char = getline('.')[col('.')-1]
    if cur_char == ')' || cur_char == '}' || cur_char == ']'
        return
    endif

    let l:pattern = '[)\]}]'
    let l:pos = search(l:pattern, 'bW')
endfunction

"######## ALE configuration  #####################################################
let g:ale_linters = {
\   'python': ['flake8', 'pyright'],
\   'go':     ['gopls', 'staticcheck'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}

let g:ale_fixers = {
\   'python': ['black', 'isort', 'trim_whitespace'],
\   'go': ['gopls'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}

let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_python_black_options='--line-length=110'
let g:ale_python_flake8_options = '--max-line-length=110'
let g:ale_enabled = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_save = 1
let g:ale_go_gopls_executable = 'gopls'
let g:ale_go_gopls_options = '--remote=auto'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"######## DONE ALE configuration  ################################################
"
"

nnoremap <silent> SS :lua require('spectre').toggle()<CR>
" Search current word (normal mode)
nnoremap <silent> SW :lua require('spectre').open_visual({select_word=true})<CR>
" Search current word (visual mode)
"vnoremap <silent> <leader>SW <Esc>:lua require('spectre').open_visual()<CR>
" Search in current file
"nnoremap <silent> <leader>SP :lua require('spectre').open_file_search({select_word=true})<CR>
"

