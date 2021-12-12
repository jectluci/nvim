call plug#begin('~/.config/nvim/plugged/')
"THemes
" Plug 'Mofiqul/dracula.nvim'
" Plug 'Mofiqul/vscode.nvim'
" Plug 'rktjmp/lush.nvim'
" Plug 'ellisonleao/gruvbox.nvim'
" Plug 'navarasu/onedark.nvim'
Plug 'tomasiser/vim-code-dark'


"opacity 
" Plug 'sunjon/shade.nvim'

"Status bar
Plug 'nvim-lualine/lualine.nvim'

"Tabbar
Plug 'alvarosevilla95/luatab.nvim'

"NerdTree
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'kyazdani42/nvim-tree.lua'


""icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'yamatsum/nvim-nonicons'
Plug 'kyazdani42/nvim-web-devicons'

"fzf
Plug 'sharkdp/bat'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }


"""sintaxys
Plug 'scrooloose/syntastic'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': 'python' }
"Plug 'neovim/node-host', { 'do': 'npm install' }
"Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
Plug 'sheerun/vim-polyglot'

"""indent
"Plug 'yggdroot/indentline'
Plug 'lukas-reineke/indent-blankline.nvim'

"""Rainbow
"Plug 'thiagoalessio/rainbow_levels.vim'
"Plug 'kien/rainbow_parentheses.vim'
Plug 'p00f/nvim-ts-rainbow'

"""Comentarios
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'
"
"""autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'rafcamlet/coc-nvim-lua'
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

"Snippets
Plug 'natebosch/dartlang-snippets'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

"Snippets VSCode
Plug 'Neevash/awesome-flutter-snippets'


""Emmet
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'

""html
Plug 'othree/html5.vim'
"""JInja2
Plug 'glench/vim-jinja2-syntax'

""css
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'

""javascript && typescript && Angular
Plug 'pangloss/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'

""python
Plug 'vim-python/python-syntax'
Plug 'davidhalter/jedi-vim'
Plug 'klen/python-mode'
Plug 'jmcantrell/vim-virtualenv'
Plug 'hacksoftware/vim-python-domain-knowledge'
"Plug 'google/yapf'
"Plug 'kevinw/pyflakes-vim'
"Plug 'nvie/vim-flake8'
Plug 'ehamberg/vim-cute-python'
"Plug 'jeetsukumaran/vim-pythonsense'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'lambdalisue/vim-django-support'
Plug 'PieterjanMontens/vim-pipenv'
Plug 'ambv/black'


"""Django
Plug 'tweekmonster/django-plus.vim'
"Plug 'tweekmonster/impsort.vim'

""flutter
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/flutter-tools.nvim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

"Plug 'hrsh7th/nvim-cmp'

""format
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sbdchd/neoformat'

"Ale
Plug 'dense-analysis/ale'
Plug 'eslint/eslint'

"GIt
Plug 'tpope/vim-fugitive'

"c++
Plug 'jackguo380/vim-lsp-cxx-highlight'

"Multi cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"Terminal
Plug 'wvffle/vimterm'
Plug 'fladson/vim-kitty' "Kitty sintaxys

"Plug Lua
Plug 'yamatsum/nvim-cursorline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'folke/lsp-colors.nvim'




call plug#end()

