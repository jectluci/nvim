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
{ 'eslint/eslint', ft={'javascript','typescript'} },
--Git
{ 'tpope/vim-fugitive' },
{'lewis6991/gitsigns.nvim'},
--
--DBUI
{ 'tpope/vim-dadbod', event = "VeryLazy"  },
{ 'kristijanhusak/vim-dadbod-ui', event = "VeryLazy" },
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
