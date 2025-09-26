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
	-- Surround
	-- { 'tpope/vim-surround' },
	{
		"roobert/surround-ui.nvim",
		dependencies = {
			"kylechui/nvim-surround",
			"folke/which-key.nvim",
		},
		config = function()
			require("surround-ui").setup({
				root_key = "S",
			})
		end,
	},
	--Suda
	{ "lambdalisue/suda.vim" },
	--Erros
	-- { 'dense-analysis/ale' },
	-- { 'eslint/eslint', ft={'javascript','typescript'} },
	--Git
	-- { 'tpope/vim-fugitive' },
	{ "lewis6991/gitsigns.nvim" },
	--
	--DBUI
	-- { 'tpope/vim-dadbod', event = "VeryLazy"  },
	-- { 'kristijanhusak/vim-dadbod-ui', event = "VeryLazy" },

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
	{ "ibhagwan/fzf-lua" },
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

	--Bookmarks
	-- {
	--     "cbochs/grapple.nvim",
	--     dependencies = {
	--         { "nvim-tree/nvim-web-devicons", lazy = true },
	--     },
	-- },

	--Formateador

	-- Formateo por archivo/ft, asincrónico
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format", "black" }, -- o "black"
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
			},
		},
	},

	-- Refractor

	{ "ThePrimeagen/refactoring.nvim", opts = {} }, -- extra-refactors (extract, inline, etc.)
	{ "Wansmer/treesj", opts = { use_default_keymaps = false } }, -- split/join de estructuras

	--folding

	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		provider_selector = function()
			return { "lsp", "indent" }
		end,
	},

	--Marker Groups
	{
		"jameswolensky/marker-groups.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required
			"ibhagwan/fzf-lua", -- Optional: fzf-lua picker
			"folke/snacks.nvim", -- Optional: Snacks picker
			"nvim-telescope/telescope.nvim", -- Optional: Telescope picker
			-- mini.pick is part of mini.nvim; this plugin vendors mini.nvim for tests,
			-- but you can also install mini.nvim explicitly to use mini.pick system-wide
			-- "nvim-mini/mini.nvim",
		},
		config = function()
			require("marker-groups").setup({
				-- Default picker is 'vim' (built-in vim.ui)
				-- Accepted values: 'vim' | 'snacks' | 'fzf-lua' | 'mini.pick' | 'telescope'
				picker = "vim",
			})
		end,
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
}
