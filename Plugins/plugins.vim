call plug#begin('~/.config/nvim/plugged/')

"----------  interface  ------------
"THemes
" Plug 'joshdick/onedark.vim'
" Plug 'morhetz/gruvbox'
Plug 'Mofiqul/dracula.nvim'

"Status bar
Plug 'nvim-lualine/lualine.nvim'

"Tabbar
Plug 'alvarosevilla95/luatab.nvim'

"""indent
Plug 'lukas-reineke/indent-blankline.nvim'


""icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'yamatsum/nvim-nonicons'
Plug 'kyazdani42/nvim-web-devicons'


"-----------  Utilidades -------------
""NvimTree 
"Plug 'kyazdani42/nvim-tree.lua'
"
"NerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
"
"EasyMotion
Plug 'easymotion/vim-easymotion'
"
"Tmux
Plug 'christoomey/vim-tmux-navigator'

"""Rainbow
Plug 'p00f/nvim-ts-rainbow'

"""Comentarios
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'

"" Surround
Plug 'tpope/vim-surround'

""format
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sbdchd/neoformat'

"fzf
Plug 'sharkdp/bat'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Multi cursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

"GIt
Plug 'tpope/vim-fugitive'

"Terminal
Plug 'wvffle/vimterm'
Plug 'fladson/vim-kitty' "Kitty sintaxys

"Suda - Sudo 
Plug 'lambdalisue/suda.vim'


"-----------  Sintaxis -------------
"""syntastic
Plug 'scrooloose/syntastic'
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': 'python' }
Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'
Plug 'jelera/vim-javascript-syntax'
Plug 'neomake/neomake'
" Plug 'othree/es.next.syntax.vim/issues'

"-----------  Errores -------------
"Ale
Plug 'dense-analysis/ale'
Plug 'eslint/eslint'
Plug 'puremourning/vimspector'


"-----------  Autocompletado  -------------
"""autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'rafcamlet/coc-nvim-lua'
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

""Snippets
Plug 'natebosch/dartlang-snippets'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

"Snippets VSCode=>
" Flutter
" Plug 'Neevash/awesome-flutter-snippets'
" React
Plug 'mlaursen/vim-react-snippets'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }




"-----------  Desarrollo web  -------------
""Emmet
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'

""html
Plug 'othree/html5.vim'
"""JInja2
Plug 'glench/vim-jinja2-syntax'
Plug 'hiphish/jinja.vim'

""css
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'

""SCSS
Plug 'tpope/vim-haml'
"Plug 'shmargum/vim-sass-colors'

""SASS
Plug 'AtsushiM/sass-compile.vim'
"Plug 'AtsushiM/search-parent.vim'

""javascript && typescript && Angular
Plug 'yuezk/vim-js'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"javascript
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'othree/yajs.vim'
"typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"Angular
"React
Plug 'yannickcr/eslint-plugin-react'
Plug 'elzr/vim-json'

"----------Desarrollo Python -----------
"Python
Plug 'vim-python/python-syntax'
Plug 'davidhalter/jedi-vim'
Plug 'klen/python-mode'
Plug 'hacksoftware/vim-python-domain-knowledge'
Plug 'ehamberg/vim-cute-python'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'ambv/black'


"Entornos virtuales
Plug 'plytophogy/vim-virtualenv'
Plug 'PieterjanMontens/vim-pipenv'
"" --
Plug 'fisadev/vim-isort'

"""Django
Plug 'tweekmonster/django-plus.vim'
""Jupyter
Plug 'jupyter-vim/jupyter-vim'


"----------Desarrollo Mobil -----------
"flutter
 Plug 'nvim-lua/plenary.nvim'
 Plug 'akinsho/flutter-tools.nvim'
 Plug 'dart-lang/dart-vim-plugin'
 Plug 'thosakwe/vim-flutter'
 Plug 'natebosch/vim-lsc'
 Plug 'natebosch/vim-lsc-dart'

""Swift
"Plug 'keith/swift.vim' " syntax highlighting
"Plug 'nvim-lua/plenary.nvim'
"Plug 'tami5/swift.nvim'

""kotlin
"Plug 'udalov/kotlin-vim'


"----------Desarrollo JAVA -----------
Plug 'mikelue/vim-maven-plugin'
Plug 'scalameta/nvim-metals'
Plug 'mfussenegger/nvim-dap'

"----------Desarrollo C++ -----------
"c++
Plug 'jackguo380/vim-lsp-cxx-highlight'

"----------Desarrollo C# -----------
"c++
Plug 'omnisharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp'
"
"
"----------Docker -----------
" Plug 'docker/docker'
" Plug 'ekalinin/dockerfile.vim'
" Plug 'kevinhui/vim-docker-tools'

"----------YAML -----------
Plug 'stephpy/vim-yaml'

"----------JSON -----------
Plug 'elzr/vim-json'

"----------PHP -----------
" Plug 'noahfrederick/vim-laravel'
" Plug 'stanangeloff/php.vim'
" Plug 'phpactor/phpactor'
" Plug 'blueyed/smarty.vim'
" Plug 'fantasyczl/smarty-vim'

"----------Bases de datos -----------
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
"
"Postgresql
Plug 'vim-scripts/dbext.vim'
Plug 'lifepillar/pgsql.vim'


"----------SVN-----------
" Plug 'juneedahamed/svnj.vim'

"----------Plugins Complementarios De lua-----------
"Plug Lua
Plug 'yamatsum/nvim-cursorline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'folke/lsp-colors.nvim'
Plug 'liuchengxu/vista.vim'

" Autocompletado de lsp
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Plug 'Shougo/ddc.vim'
" Plug 'shun/ddc-vim-lsp'




call plug#end()

