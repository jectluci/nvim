require("lazy").setup({
  --Schema
  { 
    'projekt0n/github-nvim-theme', 
    version = 'v0.0.7', 
    lazy = false,
    priority = 1000 ,
  },
  --NeoTree
  { "nvim-neo-tree/neo-tree.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "MunifTanjim/nui.nvim" },
  { 's1n7ax/nvim-window-picker' },

  --FZF
  { 'ibhagwan/fzf-lua' },
  --Icons
  { 'ryanoasis/vim-devicons' },
  { 'yamatsum/nvim-nonicons' },
  { 'DaikyXendo/nvim-material-icon' },
  --Symbols
  { 'simrat39/symbols-outline.nvim' },

  --Status bar
  { 'nvim-lualine/lualine.nvim' },
  --TabBar
  { 'akinsho/bufferline.nvim' },
  --Tmux
  { 'christoomey/vim-tmux-navigator' },
  --Rainbow
  { 'p00f/nvim-ts-rainbow' },

  --Comentarios
  { 'tpope/vim-commentary' },
  { 'scrooloose/nerdcommenter' },

  -- Surround
  { 'tpope/vim-surround' },

  -- Indent
  { "lukas-reineke/indent-blankline.nvim" },


  --Suda 
  {'lambdalisue/suda.vim'},
  --Syntaxis
  { 'scrooloose/syntastic' },
  { 'sheerun/vim-polyglot' },

  --Erros
  { 'dense-analysis/ale' },
  { 'eslint/eslint' },

  --Git
  { 'tpope/vim-fugitive' },

  --Emmet
  { 'mattn/emmet-vim' },
  --Lua
  { 'yamatsum/nvim-cursorline' },
  { 'nvim-treesitter/nvim-treesitter' },
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/nvim-lsp-installer' },
  { 'folke/lsp-colors.nvim' },
  { 'liuchengxu/vista.vim' },
  --Terminal
  { 'wvffle/vimterm' },
  { 'fladson/vim-kitty' },
  --Prettier
  { 'prettier/vim-prettier' },
  --CMP
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'SirVer/ultisnips' },
  { 'quangnguyen30192/cmp-nvim-ultisnips' },
  { 'dcampos/nvim-snippy' },
  { 'dcampos/cmp-snippy' },
  { 'onsails/lspkind.nvim' },
  --Mason
  { "williamboman/mason.nvim" },
  --COC
  { 'neoclide/coc.nvim' },
  --Cursor
  { 'gen740/SmoothCursor.nvim' },
  --DBUI
  { 'tpope/vim-dadbod'  },
  { 'kristijanhusak/vim-dadbod-ui' }

}
)
