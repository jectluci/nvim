require("lazy").setup({
----Schema
{ "folke/tokyonight.nvim",
lazy = false,
priority = 1000,
},
--NeoTree
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  }
},
{ 's1n7ax/nvim-window-picker' },

--FZF
-- { 'ibhagwan/fzf-lua' },
--Icons
{ 'ryanoasis/vim-devicons',              lazy = true,  priority = 1001 },
{ 'yamatsum/nvim-nonicons',              lazy = true,  priority = 1002 },
{ 'DaikyXendo/nvim-material-icon',       lazy = true,  priority = 1003 },
--Symbols
{ 'simrat39/symbols-outline.nvim',       lazy = true,  priority = 1006 },

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
{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },


--Suda
{ 'lambdalisue/suda.vim' },
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
--Css
{
  'brenoprata10/nvim-highlight-colors'
},
--Lua
{ 'yamatsum/nvim-cursorline' },
{ 'nvim-treesitter/nvim-treesitter' },
----Angular Treesitter
  {'nvim-treesitter/nvim-treesitter-angular'},
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
-- { 'neoclide/coc.nvim' },
--Cursor
{ 'gen740/SmoothCursor.nvim' },
--DBUI
{ 'tpope/vim-dadbod' },
{ 'kristijanhusak/vim-dadbod-ui' },
--Python
----Formater
{'averms/black-nvim'},
--
{'davidhalter/jedi-vim'},
--Autotag
{'windwp/nvim-ts-autotag'},
--Auto pairs 
{
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {} -- this is equalent to setup({}) function
},
--Refactor 
{
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup()
  end,
},
--Telescope

 {
  'nvim-telescope/telescope.nvim', 
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

}
)
