return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = {
                "lua", "vim", "vimdoc",
                "bash", "json",
                "html", "css",
                "javascript", "typescript", "tsx",
                "python",
            },
            auto_install = true,                                -- instala parsers faltantes al abrir un archivo
            highlight = { enable = true, additional_vim_regex_highlighting = false },
            indent = { enable = true, disable = { "python" } }, -- python a veces sangra de más
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    node_decremental = "grm",
                    scope_incremental = "grc",
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    { "windwp/nvim-ts-autotag" },
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', event = { 'BufReadPre', 'BufNewFile' }, cmd = 'Mason' },
    { 'm-demare/hlargs.nvim'
    },
}
