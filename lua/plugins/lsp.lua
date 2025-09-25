return {
    -- Núcleo LSP (solo este, sin lsp-installer)
    {
        "neovim/nvim-lspconfig",
        --event = "VeryLazy"
    },

    -- Colores de diagnósticos (opcional; en 0.11 ya no es tan necesario)
    { "folke/lsp-colors.nvim",   enabled = true },

    -- Neoconf (opcional, para overrides por proyecto)
    { "folke/neoconf.nvim",      cmd = "Neoconf" },

    -- Mason primero (y configurado)
    { "williamboman/mason.nvim", build = ":MasonUpdate", config = true },

    -- Mason ↔ LSP (usa IDs de lspconfig; OJO: sin llamar a setup() viejo)
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        opts = {
            ensure_installed = {
                "angularls",
                "ts_ls",
                "html",
                "cssls",
                "tailwindcss",
                "emmet_ls",
                "lua_ls",
                "pyright",
            },
            handlers = { function() end }, -- evita require('lspconfig').X.setup()
            automatic_installation = true,
        },
    },

    -- (Opcional pero útil) instalar herramientas por nombre de paquete Mason
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                -- servers (binarios)
                "angular-language-server",
                "typescript-language-server",
                "emmet-ls",
                -- linters/formatters
                "prettierd",
                "eslint_d",
                "ruff",
                "mypy",
                "black",
                "stylua",
            },
            auto_update = true,
            run_on_start = true,
        },
    },

    -- Tailwind en cmp
    {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = function()
            require("tailwindcss-colorizer-cmp").setup({ color_square_width = 2 })
        end,
    },

    -- CMP & amigos
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-emoji" },
    { "onsails/lspkind.nvim" },
    { "L3MON4D3/LuaSnip",        version = "v2.*", build = "make install_jsregexp" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/nvim-cmp-kit" }, -- opcional: no es necesario para funcionar

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
    -- { 'joeveiga/ng.nvim' },
}
