return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- branch = "main" es el default ahora, no hace falta especificarla
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            -- Instalar tus parsers
            require("nvim-treesitter").install({
                "lua", "vim", "vimdoc",
                "bash", "json",
                "html", "css", "php",
                "javascript", "typescript", "tsx",
                "python",
            })

            -- Highlighting (ahora es nativo de nvim)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function() pcall(vim.treesitter.start) end,
            })
        end,
    },
    { "windwp/nvim-ts-autotag" },
    -- { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', event = { 'BufReadPre', 'BufNewFile' }, cmd = 'Mason' },
    { 'm-demare/hlargs.nvim'
    },
}
