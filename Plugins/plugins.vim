call plug#begin('~/.config/nvim/plugged/')

"----------  interface  ------------
"Config
Plug 'editorconfig/editorconfig-vim'
"
"THemes
<<<<<<< HEAD
" Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
" Plug 'Mofiqul/dracula.nvim'
=======

" Plug 'almo7aya/neogruvbox.nvim', { 'branch': 'master' }
" Plug 'uloco/bluloco.nvim',
" Plug 'rktjmp/lush.nvim'
" Plug 'navarasu/onedark.nvim'
" Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

"symbols
Plug 'simrat39/symbols-outline.nvim'

>>>>>>> f547956 (change neovim)

"Status bar
Plug 'nvim-lualine/lualine.nvim'

"Tabbar
<<<<<<< HEAD
Plug 'alvarosevilla95/luatab.nvim'
=======
" Plug 'alvarosevilla95/luatab.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
>>>>>>> f547956 (change neovim)

"""indent
Plug 'lukas-reineke/indent-blankline.nvim'


""icons
Plug 'ryanoasis/vim-devicons'
<<<<<<< HEAD
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'yamatsum/nvim-nonicons'
Plug 'kyazdani42/nvim-web-devicons'
=======
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'yamatsum/nvim-nonicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'DaikyXendo/nvim-material-icon'
>>>>>>> f547956 (change neovim)


"-----------  Utilidades -------------
""NvimTree 
"Plug 'kyazdani42/nvim-tree.lua'
"
<<<<<<< HEAD
"NerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
"
"EasyMotion
"Plug 'easymotion/vim-easymotion'
=======
"NeoTree
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 's1n7ax/nvim-window-picker'
"
"
"NerdTree
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'jistr/vim-nerdtree-tabs'
"
"EasyMotion
Plug 'easymotion/vim-easymotion'
>>>>>>> f547956 (change neovim)
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

<<<<<<< HEAD
=======
"Curosr
Plug 'gen740/SmoothCursor.nvim'

>>>>>>> f547956 (change neovim)
"GIt
Plug 'tpope/vim-fugitive'

"Terminal
Plug 'wvffle/vimterm'
Plug 'fladson/vim-kitty' "Kitty sintaxys

"Suda - Sudo 
Plug 'lambdalisue/suda.vim'

<<<<<<< HEAD
=======
"Fold
Plug 'anuvyklack/fold-preview.nvim' "Permite personalizar los folds
Plug 'anuvyklack/pretty-fold.nvim' "Muestra lo que esta dentro del fold
Plug 'anuvyklack/keymap-amend.nvim' "Plugin necesario para usar fold-preview

" autoPairs

" Plug 'windwp/nvim-autopairs'

>>>>>>> f547956 (change neovim)

"-----------  Sintaxis -------------
"""syntastic
Plug 'scrooloose/syntastic'
<<<<<<< HEAD
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': 'python' }
Plug 'sheerun/vim-polyglot'
"Plug 'jparise/vim-graphql'
"Plug 'jelera/vim-javascript-syntax'
Plug 'neomake/neomake'
" Plug 'othree/es.next.syntax.vim/issues'
=======
Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'
Plug 'jelera/vim-javascript-syntax'
Plug 'neomake/neomake'
>>>>>>> f547956 (change neovim)

"-----------  Errores -------------
"Ale
Plug 'dense-analysis/ale'
Plug 'eslint/eslint'
Plug 'puremourning/vimspector'
<<<<<<< HEAD
=======
Plug 'mcauley-penney/tidy.nvim'
>>>>>>> f547956 (change neovim)


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
<<<<<<< HEAD
=======
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'


Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
 " Plug 'L3MON4D3/LuaSnip'
 " Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
 Plug 'SirVer/ultisnips'
 Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
 Plug 'dcampos/nvim-snippy'
 Plug 'dcampos/cmp-snippy'

>>>>>>> f547956 (change neovim)

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
<<<<<<< HEAD
"Plug 'tpope/vim-haml'
"Plug 'shmargum/vim-sass-colors'
=======
Plug 'tpope/vim-haml'
Plug 'shmargum/vim-sass-colors'
>>>>>>> f547956 (change neovim)

""SASS
"Plug 'AtsushiM/sass-compile.vim'
"Plug 'AtsushiM/search-parent.vim'

""javascript && typescript && Angular
Plug 'yuezk/vim-js'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
<<<<<<< HEAD
=======
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
>>>>>>> f547956 (change neovim)
"javascript
"Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'maxmellon/vim-jsx-pretty'
"Plug 'othree/yajs.vim'
"typescript
"Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"Angular
"React
Plug 'yannickcr/eslint-plugin-react'
Plug 'elzr/vim-json'

"----------Desarrollo Python -----------
"Python
Plug 'vim-python/python-syntax'
Plug 'davidhalter/jedi-vim'
<<<<<<< HEAD
Plug 'klen/python-mode'
Plug 'hacksoftware/vim-python-domain-knowledge'
Plug 'ehamberg/vim-cute-python'
=======
" Plug 'klen/python-mode'
Plug 'hacksoftware/vim-python-domain-knowledge'
" Plug 'ehamberg/vim-cute-python'
>>>>>>> f547956 (change neovim)
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'ambv/black'


"Entornos virtuales
Plug 'plytophogy/vim-virtualenv'
Plug 'PieterjanMontens/vim-pipenv'
"" --
Plug 'fisadev/vim-isort'

"""Django
"Plug 'tweekmonster/django-plus.vim'
""Jupyter
"Plug 'jupyter-vim/jupyter-vim'
<<<<<<< HEAD


"----------Desarrollo Mobil -----------
"flutter
" Plug 'nvim-lua/plenary.nvim'
=======
" Plug 'AckslD/swenv.nvim'

"----------Desarrollo Mobil -----------
"flutter
Plug 'nvim-lua/plenary.nvim'
>>>>>>> f547956 (change neovim)
" Plug 'akinsho/flutter-tools.nvim'
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'thosakwe/vim-flutter'
" Plug 'natebosch/vim-lsc'
" Plug 'natebosch/vim-lsc-dart'

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
"Plug 'jackguo380/vim-lsp-cxx-highlight'

"----------Desarrollo C# -----------
"c++
<<<<<<< HEAD
Plug 'omnisharp/omnisharp-vim'
Plug 'nickspoons/vim-sharpenup'
Plug 'OrangeT/vim-csharp'
Plug 'nickspoons/vim-sharpenup'
"
"
"----------Docker -----------
Plug 'docker/docker'
Plug 'ekalinin/dockerfile.vim'
Plug 'kevinhui/vim-docker-tools'
=======
" Plug 'omnisharp/omnisharp-vim'
" Plug 'nickspoons/vim-sharpenup'
" Plug 'OrangeT/vim-csharp'
" Plug 'nickspoons/vim-sharpenup'
"
"
"----------Docker -----------
" Plug 'docker/docker'
" Plug 'ekalinin/dockerfile.vim'
" Plug 'kevinhui/vim-docker-tools'
>>>>>>> f547956 (change neovim)

"----------YAML -----------
Plug 'stephpy/vim-yaml'

"----------JSON -----------
Plug 'elzr/vim-json'

"----------PHP -----------
<<<<<<< HEAD
" Plug 'noahfrederick/vim-laravel'
" Plug 'stanangeloff/php.vim'
" Plug 'phpactor/phpactor'
" Plug 'blueyed/smarty.vim'
" Plug 'fantasyczl/smarty-vim'
=======
" Plug 'jwalton512/vim-blade'
" Plug 'noahfrederick/vim-laravel'
" Plug 'stanangeloff/php.vim'
" Plug 'lvht/phpcd.vim'

>>>>>>> f547956 (change neovim)

"----------Bases de datos -----------
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'
"
"Postgresql
"Plug 'vim-scripts/dbext.vim'
"Plug 'lifepillar/pgsql.vim'


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
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'Shougo/ddc.vim'
Plug 'shun/ddc-vim-lsp'

<<<<<<< HEAD
=======
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'


Plug 'onsails/lspkind.nvim'

>>>>>>> f547956 (change neovim)
"------Plugins de cargado Para mas rapido---------
Plug 'nathom/filetype.nvim'
Plug 'lewis6991/impatient.nvim'

<<<<<<< HEAD

=======
Plug 'editorconfig/editorconfig-vim'

"- Tetris-"
" Plug 'alec-gibson/nvim-tetris'
"----------Plugins GUI------------"
Plug 'equalsraf/neovim-gui-shim'
"-----Plug Discord------- "
Plug 'andweeb/presence.nvim'
>>>>>>> f547956 (change neovim)

call plug#end()

