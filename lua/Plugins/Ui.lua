return {

--Icons
{ 'ryanoasis/vim-devicons'               },
{ 'yamatsum/nvim-nonicons'         },
{ 'DaikyXendo/nvim-material-icon'        },
{"nvim-tree/nvim-web-devicons"}, --Symbols
{ 'simrat39/symbols-outline.nvim'       },

--Status bar
{ 'nvim-lualine/lualine.nvim' },
--TabBar
{ 'akinsho/bufferline.nvim' },
--Rainbow
{ 'p00f/nvim-ts-rainbow' },
-- Indent
{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },


--Lua
{ 'yamatsum/nvim-cursorline' },
--Cursor
{ 'gen740/SmoothCursor.nvim' },

--Telescope
{
 'nvim-telescope/telescope.nvim', 
   dependencies = { 'nvim-lua/plenary.nvim' }
 },

--Notify 
{'rcarriga/nvim-notify'},

}
