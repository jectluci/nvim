return {
--LSP
{
  "neovim/nvim-lspconfig",
  events = "VeryLazy",
},
-- { 'williamboman/nvim-lsp-installer' },
{ 'folke/lsp-colors.nvim' },
--NEOCONF 
  { "folke/neoconf.nvim", cmd = "Neoconf" },

--Mason
-- Mason (instalador de LSPs, linters, formatters)
{
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "mypy", "ruff", "pyright", "lua_ls", "html", "cssls", "tsserver", "emmet-ls"
      },
    },
  },
{
    "williamboman/mason-lspconfig.nvim"},
--TaildWindCss
{
  "roobert/tailwindcss-colorizer-cmp.nvim",
  -- optionally, override the default options:
  config = function()
    require("tailwindcss-colorizer-cmp").setup({
      color_square_width = 2,
    })
  end
},

--CMP 
{
  "hrsh7th/nvim-cmp",
},
{ 'hrsh7th/cmp-nvim-lsp' },
{ 'hrsh7th/cmp-buffer' },
{ 'hrsh7th/cmp-path' },
{ 'hrsh7th/cmp-cmdline' },
  {'hrsh7th/cmp-emoji'},
{ 'onsails/lspkind.nvim' },

  { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
  { "saadparwaiz1/cmp_luasnip" },

--Lua
-- { 'liuchengxu/vista.vim' },

-- {
--   "utilyre/barbecue.nvim",
--   name = "barbecue",
--   version = "*",
--   dependencies = {
--     "SmiteshP/nvim-navic",
--     "nvim-tree/nvim-web-devicons", -- optional dependency
--   },
-- },
--Syntaxis
-- { 'scrooloose/syntastic' },
-- { 'sheerun/vim-polyglot' },
--Angular 
{ 'joeveiga/ng.nvim'},

}
