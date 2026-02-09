return {
    -- En tu archivo de plugins
    {
        'neovim/nvim-lspconfig',
        lazy = true, -- Solo se carga cuando se necesita
    },
    -- Colores de diagnósticos (opcional; en 0.11 ya no es tan necesario)
    { "folke/lsp-colors.nvim", enabled = true },

    -- Neoconf (opcional, para overrides por proyecto)
    { "folke/neoconf.nvim",    cmd = "Neoconf" },

    { 'joeveiga/ng.nvim' },
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },
}
