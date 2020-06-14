" 开启锁进
filetype plugin indent on

" 设置自己Leader键
let mapleader = "\<space>" 
let maplocalleader = "-"

" 快速保存退出
nmap <leader>w :w!<cr>

" 只能处理退格键的功能
set backspace=eol,start,indent

" 忽略大小写
set ignorecase
set smartcase

" 高亮查找关键字
set hlsearch

" 查找关键字时，及时匹配
set incsearch

" 设置字符
syntax enable
set encoding=utf8

" 不自动备份文件
set nobackup
set nowritebackup

" 不产生交换文件
set noswapfile

" 兼容tmux
set term=screen-256color
set background=dark

" tab == 2 space
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

" autocmd FileType markdown set shiftwidth=4 tabstop=4
set autoindent
set smartindent
set autoread
" set CursortHold,CursorHoldI * checktime

" 自动换行
set wrap

" 快速切换窗口
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set switchbuf=useopen,usetab,newtab
set showtabline=2

" 显示状态栏
set laststatus=2

" 缩进
set foldmethod=syntax

" 多文件操作保留操作记录
set undofile
set undodir=~/.vim-config/undo_dirs

" 开启剪切板
set clipboard=unnamedplus


" manage vim plugin via vim-plug {{{
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'yggdroot/leaderf'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'angular/angular-cli'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim',{'branch': 'release'}
Plug 'chun-yang/auto-pairs'
Plug 'mhinz/vim-startify'

call plug#end()

" => Nerd Tree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<cr>
map <leader>nf :NERDTreeFind<cr>

" => CTRL-P
let g:ctrlp_working_path_mode = 0
map <leader>f :CtrlPMRUFiles<cr>
map <leader>b :CtrlPBuffer<cr>
let g:ctrlp_max_height = 15
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" => vim-markdown
let g:vim_markdown_new_list_item_indent = 4
let dart_style_guide = 2
let dart_format_on_save = 1

" }}}

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out .
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" customize my vim 
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
inoremap jk <esc>
" :inoremap <esc> <nop>
autocmd BufWritePre,BufRead *.html :normal gg=G
autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
iabbrev <buffer> --- &mdash;
autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
autocmd FileType python :iabbrev <buffer> iff if:<left>
