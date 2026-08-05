return {
    --Tmux
    { "christoomey/vim-tmux-navigator" },
    --Comentarios
    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
    },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    -- {
    --     "roobert/surround-ui.nvim",
    --     dependencies = {
    --         "kylechui/nvim-surround",
    --         "folke/which-key.nvim",
    --     },
    --     config = function()
    --         require("surround-ui").setup({
    --             root_key = "S",
    --         })
    --     end,
    -- },
    --Suda
    { "lambdalisue/suda.vim" },
    --Erros
    --Git
    { "lewis6991/gitsigns.nvim" },
    --
    --DBUI
    -- { 'tpope/vim-dadbod',                     event = "VeryLazy" },
    -- { 'kristijanhusak/vim-dadbod-ui',         event = "VeryLazy" },
    -- { 'kristijanhusak/vim-dadbod-completion', event = "VeryLazy" },
    --Debugger
    { "mfussenegger/nvim-dap" },
    { "mfussenegger/nvim-dap-python" },

    {
        "mfussenegger/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
    },
    --Windos Picker
    { "s1n7ax/nvim-window-picker" },
    --FZF
    {
        "ibhagwan/fzf-lua",
        branch = 'main',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    --Auto Pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },
    --Autotag
    { "windwp/nvim-ts-autotag" },
    ----markDown

    ---- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    ---- Terminal

    { "akinsho/toggleterm.nvim", version = "*", config = true },

    --Simbols Outline
    -- {
    --     "simrat39/symbols-outline.nvim",
    --     cmd = "SymbolsOutline",
    --     keys = { { "<leader>so", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    --     config = true,
    --   },
    --Run code

    -- {'michaelb/sniprun'},

    --REefactor
    -- {'hood/popui.nvim'},

    -- Vista
    -- {
    --   'liuchengxu/vista.vim',
    --   config = function()
    --     vim.g.vista_default_executive = 'ctags'
    --   end
    -- },


    --Formateador

    -- Formateo por archivo/ft, asincrónico
    {
        "stevearc/conform.nvim",
        opts = {
            format_on_save = {
                timeout_ms = 300,       -- más rápido
                lsp_format = "fallback" -- reemplaza lsp_fallback (deprecado)
            },
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "ruff_format" }, -- quita black, ruff ya lo cubre
                javascript = { "prettierd", stop_after_first = true },
                typescript = { "prettierd", stop_after_first = true },
                html = { "prettierd", stop_after_first = true },
                htmlangular = { "prettierd", stop_after_first = true }, -- templates Angular
                css = { "prettierd", stop_after_first = true },
                vue = { "prettierd", stop_after_first = true },
            },
        },
    },

    -- Refractor
    --folding

    {
        "kevinhwang91/nvim-ufo",
        event = "BufReadPost", -- lazy, solo cuando abres un archivo
        dependencies = { "kevinhwang91/promise-async" },
        opts = {
            provider_selector = function()
                return { "lsp", "indent" }
            end,
        },
        -- Keymaps para abrir/cerrar folds
        keys = {
            { "zR", function() require("ufo").openAllFolds() end,  desc = "Open all folds" },
            { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
            {
                "zK",
                function()
                    local winid = require("ufo").peekFoldedLinesUnderCursor()
                    if not winid then vim.lsp.buf.hover() end
                end,
                desc = "Peek fold"
            },
        },
    },

    --Marker Groups
    {
        "jameswolensky/marker-groups.nvim",
        dependencies = {
            "folke/snacks.nvim"
            -- "ibhagwan/fzf-lua",              -- Optional: fzf-lua picker
            -- "folke/snacks.nvim",             -- Optional: Snacks picker
            -- "nvim-telescope/telescope.nvim", -- Optional: Telescope picker
            -- mini.pick is part of mini.nvim; this plugin vendors mini.nvim for tests,
            -- but you can also install mini.nvim explicitly to use mini.pick system-wide
            -- "nvim-mini/mini.nvim",
        },
        keys = { "<leader>m" }, -- el key que uses para abrirlo
        config = function()
            require("marker-groups").setup({
                picker = "snacks",
            })
        end,
    },

    {
        "mattn/emmet-vim",
        ft = { "html", "htmlangular", "css", "typescriptreact", "vue" }, -- lazy por filetype
    },

    --Faster
    {
        "pteroctopus/faster.nvim",
        config = function()
            require("faster").setup()
        end,
    },
    --vim iluminate
    { "RRethy/vim-illuminate" },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
}
