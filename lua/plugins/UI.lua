return {

    { 'DaikyXendo/nvim-material-icon' },
    { "nvim-tree/nvim-web-devicons" }, --Symbols
    { "SmiteshP/nvim-navic" },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },


    --Notify
    { 'rcarriga/nvim-notify' },
    -- lazy
    {
        "sontungexpt/witch-line",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false, -- Almost component is lazy load by default. So you can set lazy to false
        opts = {},
    },


}
