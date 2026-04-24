return {
    {
        'Mofiqul/dracula.nvim',
        lazy = false,
        priority = 1000,
        opts = function()
            vim.cmd([[colorscheme dracula]])
        end
    },
}
