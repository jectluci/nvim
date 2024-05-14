return {
--Tmux
{ 'christoomey/vim-tmux-navigator' },
--Comentarios
{ 'tpope/vim-commentary' },
{ 'scrooloose/nerdcommenter' },
-- Surround
{ 'tpope/vim-surround' },
{
  "roobert/surround-ui.nvim",
  dependencies = {
    "kylechui/nvim-surround",
    "folke/which-key.nvim",
  },
  config = function()
    require("surround-ui").setup({
      root_key = "S"
    })
  end,
},
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
--REST 
{
  "vhyrro/luarocks.nvim",
  priority = 1000,
  config = true,
  opts = {
      rocks = {"mimetypes","nvim-nio","xml2lua", "lua-curl"}
    }
},
{
  "rest-nvim/rest.nvim",
  dependencies = { "luarocks.nvim" },
  config = function()
    require("rest-nvim").setup()
  end,
},
--markDown

-- install without yarn or npm
{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
}

-- install with yarn or npm

}
