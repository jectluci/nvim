return {
--LSP
{ 'neovim/nvim-lspconfig' },
{ 'williamboman/nvim-lsp-installer' },
{ 'folke/lsp-colors.nvim' },
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
{ "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "mypy",
      "ruff",
      "pyright"
    }
  }
},
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
--Lua
{ 'liuchengxu/vista.vim' },
--Syntaxis
{ 'scrooloose/syntastic' },
{ 'sheerun/vim-polyglot' },
}
