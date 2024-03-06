return {
--Tmux
{ 'christoomey/vim-tmux-navigator' },
--Comentarios
{ 'tpope/vim-commentary' },
{ 'scrooloose/nerdcommenter' },
-- Surround
{ 'tpope/vim-surround' },
--Suda
{'lambdalisue/suda.vim' },
--Erros
{ 'dense-analysis/ale' },
{ 'eslint/eslint' },
--Git
{ 'tpope/vim-fugitive' },
--Terminal
{ 'wvffle/vimterm' },
{ 'fladson/vim-kitty' },
--DBUI
{ 'tpope/vim-dadbod' },
{ 'kristijanhusak/vim-dadbod-ui' },
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
--rest
{ "rest-nvim/rest.nvim",
   dependencies = { { "nvim-lua/plenary.nvim" } },
},

--Debugger 
{'mfussenegger/nvim-dap'},
{'mfussenegger/nvim-dap-python',
},

{'mfussenegger/nvim-dap-ui',
  dependencies = "mfussenegger/nvim-dap",
},
--Windos Picker
{ 's1n7ax/nvim-window-picker' },
--FZF
{ 'ibhagwan/fzf-lua' },
--Auto Pairs
{
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {} -- this is equalent to setup({}) function
},
--Autotag
{'windwp/nvim-ts-autotag'},

}
