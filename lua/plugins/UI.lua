return {

    --Icons
    -- { 'ryanoasis/vim-devicons'               },
    -- { 'yamatsum/nvim-nonicons'         },
    { 'DaikyXendo/nvim-material-icon' },
    { "nvim-tree/nvim-web-devicons" }, --Symbols
    -- { 'simrat39/symbols-outline.nvim'       },
    -- {
    --     '2kabhishek/nerdy.nvim',
    --     dependencies = {
    --         'folke/snacks.nvim',
    --     },
    --    cmd = 'Nerdy',
    --     opts = {
    --         max_recents = 30, -- Configure recent icons limit
    --         add_default_keybindings = true, -- Add default keybindings
    --         use_new_command = true, -- Enable new command system
    --     }
    -- },
    --Status bar
    {
        'nvim-lualine/lualine.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    { "SmiteshP/nvim-navic" },
    --TabBar
    -- { 'akinsho/bufferline.nvim' },
    --Rainbow
    -- { 'p00f/nvim-ts-rainbow' },
    -- Indent
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- {
    --   "shellRaining/hlchunk.nvim",
    --   event = { "BufReadPre", "BufNewFile" },
    --   config = function()
    --     require("hlchunk").setup({})
    --   end
    -- },
    --Lua
    -- { 'yamatsum/nvim-cursorline' },
    --Cursor
    -- { 'gen740/SmoothCursor.nvim' },


    --ICONS
    { 'nvim-mini/mini.nvim',                 version = '*' },
    { 'onsails/lspkind.nvim' },
    --Notify
    { 'rcarriga/nvim-notify' },

}
