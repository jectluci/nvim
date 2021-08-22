call plug#begin('~/.config/nvim/plugged/')
"THemes
Plug 'dracula/vim',{'as':'dracula'}
Plug 'joshdick/onedark.vim'
Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'
Plug 'greduan/emacs-theme-gruvbox'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'sainnhe/edge'

""airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

""NerdTree
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Xuyuanp/nerdtree-git-plugin'

""icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

""sintaxys
Plug 'scrooloose/syntastic'

""indent
Plug 'yggdroot/indentline'

""Rainbow
Plug 'thiagoalessio/rainbow_levels.vim'

"plegado
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

""Comentarios
Plug 'tpope/vim-commentary'
"Plug 'scrooloose/nerdcommenter'

""autocomplete
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim'
Plug 'honza/vim-snippets'

""Emmet
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'

""html
Plug 'othree/html5.vim'

""css
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'

""javascript
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'

""python
Plug 'hdima/python-syntax'
Plug 'davidhalter/jedi-vim'
Plug 'klen/python-mode'
Plug 'jmcantrell/vim-virtualenv'
Plug 'hacksoftware/vim-python-domain-knowledge'

""flutter

""format
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"Ale 
Plug 'w0rp/ale'

"GIt
Plug 'tpope/vim-fugitive'

"Multi cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()
