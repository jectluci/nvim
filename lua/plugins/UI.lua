return {

    { 'DaikyXendo/nvim-material-icon' },
    { "nvim-tree/nvim-web-devicons" }, --Symbols
    { "SmiteshP/nvim-navic" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },


    --Notify
    { 'rcarriga/nvim-notify' },
    -- lazy
    --
    -- lua/plugins/heirline.lua
    -- Heirline statusline config para lazy.nvim + LSP nativo + blink.cmp
    -- Reemplaza witch-line

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
}
