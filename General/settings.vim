set nocompatible
set number
set numberwidth=1
set clipboard=unnamed
syntax on
set showcmd
set ruler
set cursorline
set showmatch
set sw=2
set relativenumber
set tabstop=8     ""- tabs are at proper location
set expandtab     ""- don't use actual tab character (ctrl-v)
set shiftwidth=4  ""- indenting is 4 spaces
set autoindent    ""- turns it on
set smartindent   ""- does the right thing (mostly) in programs
set cindent       ""- stricter rules for C programs

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
