"++++++++++++++++++
"++ Essentials ++++
"++++++++++++++++++
set nocompatible
filetype plugin indent on
set t_Co=256
syntax on
syntax enable
set number

"++++++++++++++++++++
"++ Load plugins ++++
"++++++++++++++++++++

"Pathogen (https://github.com/tpope/vim-pathogen)
call pathogen#infect()


"++++++++++++++++
"++ Mappings ++++
"++++++++++++++++
"Default explorer will behave more like NERDTree
let g:netrw_liststyle=3 " Use tree-mode as default view

"control spacing is much faster than pressing escape
imap jj  <Esc>
map <leader>o :MRU<CR>

"Easy window moves
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Easy 'big' moves
map J 10j
map K 10k
map L 10l
map H 10h

"Window switching: ctrl+[hjkl]
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap <C-Q> <C-W>q

"Sick tab
map = gt
map - gT

"Move around more like a normal editor
nnoremap j gj
nnoremap k gk

".vimrc auto source
nnoremap <Leader>sv :so $MYVIMRC<CR>

"shortcut to edit .vimrc and .bash_profile
noremap <Leader>v :tabe ~/.vimrc<CR>
noremap <Leader>V :tabe ~/.bashrc<CR>

"insert lines without leaving normal mode
map <S-Enter> o<Esc>

"open tabs easily
map + :tabe .<CR>

"underpy save
nnoremap ` <Esc>:w<CR>
"save and quit with a double tap
nnoremap `` <Esc>:w<CR>:q<CR>
"quit with a triple tap
nnoremap ``` <Esc>:q<CR>

"++++++++++++++
"++ Visual ++++
"++++++++++++++
colorscheme Monokai

"colorscheme ron "In case we're out of Solarized some day

" This shows what you are typing as a command. Awesome.
set showcmd

"Highlight lines if they're over 80 chars. New way. (VIM > 7.2)
if exists('+colorcolumn')
  highlight ColorColumn ctermbg=8
  set colorcolumn=100
endif

"Highlight lines if they're over 80 chars. Old way.
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

"Show the cursor position all the time
set ruler

"Show title in title bar
set title

"Highlight the current line
set cursorline

"display invisible chars
set list
set listchars=tab:⇥·,trail:·

"Trailing spaces in red
match Error /\v\s+$/

" Show (partial) command in status line.
set showcmd


"++++++++++++
"++ Code ++++
"++++++++++++

" This being the 21st century, I use Unicode
set encoding=utf-8
set fileencoding=utf-8

" Show matching brackets.
set showmatch

" always set autoindenting on
set ai

" Don't wrap words by default
set textwidth=0

"Filetype adjustments
autocmd BufEnter *.md setlocal filetype=markdown
autocmd BufEnter *.css.tmpl setlocal filetype=css
autocmd BufEnter *.js.tmpl setlocal filetype=javascript


"++++++++++++++
"++ Search ++++
"++++++++++++++

" Case insensitive matching
set ignorecase

" Case sensitive matching if caps in search string
set smartcase

" Search on steroids
set hlsearch
set incsearch

" Use BASH style completion
set wildmenu
set wildmode=list:longest,full


"++++++++++++++++++++
"++ Indentation! ++++
"++++++++++++++++++++

set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2


"+++++++++++++
"++ Misc. ++++
"+++++++++++++

"MRU awesomeness
let MRU_Max_Entries = 1000

"Keep 100,000 lines of command line history. You cannot have enough.
set history=100000

"Save the Marks. All of them.
set viminfo='1000,f1

"Default split opening position shall be to the right and below
set splitright
set splitbelow

"Auto-reload files, if there's no conflict
set autoread

"Do not keep buffer after tab closed
set nohidden

"no intro message, no swap-file message
set shortmess+=IA

" leave more context around cursor
set scrolloff=3

set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start

"Code folding. za
"set foldmethod=indent
"set foldlevel=99

"Manual folds, backed up and restored
set foldmethod=manual


"+++++++++++++++++++++
"++ Yelp specific ++++
"+++++++++++++++++++++

let git_email = substitute(system('echo $GIT_COMMITTER_EMAIL'), '\n', '', '')
if git_email == 'abrousse@yelp.com'
  "Hopefully ctags
  set tags=~/tags;/
  map <c-g> :RopeGotoDefinition<CR>

  "Internal pastebin
  map <leader>pb :w !pastebinit -<CR>

  "Drop a debugger FUCK IT!
  ab fuckit import ipdb; ipdb.set_trace()

  "This is Yelp's style
  set noexpandtab
  set softtabstop=4
  set tabstop=4
  set shiftwidth=4

  "Stop caring about compiled crap
  set wildignore+=*.o,*.obj,.git,*.pyc,^{test}templates/*.py,#*#,build/*

  "Tabspire setup (wstyke.com/tabspire)
  let g:vimspire_map_keys=0
  let g:tabspire_client_id="NONO"
  noremap <leader>l :OpenURL trac/ticket/<cword><CR>
  noremap <M-o> :OpenTabByName 
  noremap <Leader>M :ReloadTabByName 
  noremap <Leader>j :ReloadFocusMark 
  noremap <Leader>J :FocusMark 
  noremap <M-R> :ReloadCurrentTab<CR>
  noremap <c-k> :OpenGoogleSearch 
  noremap <c-l> :OpenURL 
  vnoremap <Leader>pb :call OpenPB()<CR>
  noremap <c-i> :FocusCurrentWindow<CR>

  "CommandT stuff (https://github.com/wincent/Command-T)
  "Yes, Yelp has a large codebase.
  let g:CommandTMaxFiles=100000
  noremap <Leader>f :CommandTFlush<CR>

  "BEGIN TESTIFY SERVER
  function! StoreTestPath(filename, lineno)
    let g:t= a:filename
    let g:f = system("~/.vim/testifyserver/test_finder.py ".shellescape(a:filename)." ".shellescape(a:lineno))
    let g:f=substitute(strtrans(g:f),'\^@',' ','g')
    echo g:t g:f
  endfun

  function! RunTests(test_name, test_path)
    call TellTestServerToReloadFile(a:test_name)
    let args = a:test_name." ".a:test_path
    let l:t = system("~/.vim/testifyserver/runtests.py ".shellescape(args).' & 2>&1 > /dev/null')
  endfun

  map <Leader>s :call StoreTestPath(expand("%"), line("."))<CR>
  map <Leader>r :call RunTests(g:t, g:f)<CR>

  function! TellTestServerToReloadFile(filename)
    let l:x = system('~/.vim/testifyserver/reloadfile.py '.shellescape(a:filename).' & 2>&1 > /dev/null')
  endfun
  map <Leader>r :call TellTestServerToReloadFile(expand("%"))<CR>
  autocmd BufWritePre * :call TellTestServerToReloadFile(expand("%"))
  "END TESTIFY SERVER

endif
