set nocompatible
set nosi
set wrap
set noai
set noautoindent
set nocindent
set nosmartindent

autocmd! GUIEnter * set vb t_vb=
set noerrorbells
set novisualbell
set visualbell t_vb=
set t_vb=

" Enable syntax highlighting
syntax on
colorscheme danny

set t_Co=256

set wildmenu

set ignorecase
set smartcase

set laststatus=2
set number
set cursorline

set expandtab
set tabstop=2
set shiftwidth=2

set backspace=indent,eol,start

" Minimap "
let g:minimap_highlight='Visual'

" Mappings "
map Y y$
imap jj <Esc>

function! EasyDebug()
  " CLEAR REGISTERS

  let reg_n = 'z'
  let reg = '"'.reg_n
  let reg_save = getreg(reg)
  let reg_type = getregtype(reg)
  " yank until space
  silent exe 'norm! '.reg.'yt '
  let value = getreg(reg)
  " look for : inside of value
  if value =~ ":"
    let value = split(value, ":")[0]
  end
  " if no space found, look for =
  if len(value)<2
    " yank until =
    silent exe 'norm! '.reg.'yt='
    let value = getreg(reg)

    " if no = found, look for :
    if len(value)<2
      " yank until =
      silent exe 'norm! '.reg.'yt:'
      let value = getreg(reg)

      " if no =, yank until end of line
      if len(value)<2
        silent exe 'norm! '.reg.'y$'
        let value = getreg(reg)
      endif
    endif
  endif
  echo value
  silent exe "norm! oprint(\"".value." is: \" .. ".value.")\<esc>"
  exe 'let @'.reg_n.' = ""'
endfun

nnoremap <leader>p :call EasyDebug()<CR>

" Nerd Tree"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
map <C-l> :tabn<CR>
map <C-h> :tabp<CR>

" Files and shit
set noswapfile

" lua-vim
let g:lua_compiler_name = '/usr/local/bin/luac'

" neo complete "
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Plugins "
call plug#begin('~/.vim/plugged')
Plug 'tbastos/vim-lua'
Plug 'xolox/vim-lua-ftplugin'
"Plug 'valloric/youcompleteme'
Plug 'xolox/vim-misc'
Plug 'flazz/vim-colorschemes'
Plug 'myusuf3/numbers.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'Shougo/neocomplete.vim'
call plug#end()
