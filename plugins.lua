require("lazy").setup({
  --Schema
  {'folke/tokyonight.nvim', lazy=false, priority=1000},
	--NeoTree
  {"nvim-neo-tree/neo-tree.nvim"},
  {"nvim-lua/plenary.nvim"},
  {"nvim-tree/nvim-web-devicons"}, 
  {"MunifTanjim/nui.nvim"},
  {'s1n7ax/nvim-window-picker'},
  
  --Icons
  {'ryanoasis/vim-devicons'},
  {'yamatsum/nvim-nonicons'},
  {'DaikyXendo/nvim-material-icon'},
  --Symbols
  {'simrat39/symbols-outline.nvim'},

	--Status bar
	{'nvim-lualine/lualine.nvim'},
  --TabBar
	{'akinsho/bufferline.nvim'},
  --Tmux
	{'christoomey/vim-tmux-navigator'},
--Rainbow
{ 'p00f/nvim-ts-rainbow'},

--Comentarios
{ 'tpope/vim-commentary'},
{ 'scrooloose/nerdcommenter'},

-- Surround
{ 'tpope/vim-surround'},


--Syntaxis
 {'scrooloose/syntastic'}, 
 {'sheerun/vim-polyglot'},

--Erros 
 {'dense-analysis/ale'},
 {'eslint/eslint', lazy = true,ft = "javascript" },

 --Git
 {'tpope/vim-fugitive'},

--Lua
 {'yamatsum/nvim-cursorline'},
 {'nvim-treesitter/nvim-treesitter'}, 
 { 'neovim/nvim-lspconfig'},
 {'williamboman/nvim-lsp-installer'},
 {'folke/lsp-colors.nvim'},
 {'liuchengxu/vista.vim'},
 --Terminal
 {'wvffle/vimterm'},
 {'fladson/vim-kitty'}



}
)


