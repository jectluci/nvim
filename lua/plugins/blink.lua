return {
    'saghen/blink.cmp',
    dependencies = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim", -- Add this
        "echasnovski/mini.icons",
        "nvim-tree/nvim-web-devicons",
    },
    version = '1.*',
    opts = {
        keymap = {
            preset        = "none",
            ["<C-Space>"] = { "show", "show_documentation" },
            ["<C-e>"]     = { "hide" },
            ["<CR>"]      = { "accept", "fallback" },
            ["<Tab>"]     = { "select_next", "snippet_forward", "fallback" },
            ["<S-Tab>"]   = { "select_prev", "snippet_backward", "fallback" },
            ["<C-n>"]     = { "select_next", "fallback" },
            ["<C-p>"]     = { "select_prev", "fallback" },
            ["<Down>"]    = { "select_next", "show" },
            ["<Up>"]      = { "select_prev", "show" },
            ["<C-b>"]     = { "scroll_documentation_up", "fallback" },
            ["<C-f>"]     = { "scroll_documentation_down", "fallback" },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        completion = {
            keyword = { range = 'full' },
            documentation = { auto_show = true },
            menu = {
                draw = {
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local mini_icon, _ = require("nvim-web-devicons").get_icon(ctx.label, nil,
                                        { default = true })
                                    if mini_icon then return mini_icon .. ctx.icon_gap end
                                end
                                local lspkind_ok, lspkind = pcall(require, "lspkind")
                                if lspkind_ok and lspkind.symbolic then
                                    local icon = lspkind.symbolic(ctx.kind, { mode = "symbol" })
                                    if icon then return icon .. ctx.icon_gap end
                                end
                                return ctx.kind_icon .. ctx.icon_gap -- fallback
                            end,
                            highlight = function(ctx)
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local mini_icon, mini_hl = require("mini.icons").get('file', ctx.label)
                                    if mini_icon then return mini_hl end
                                end
                                return ctx.kind_hl
                            end,
                        },
                        kind = {
                            highlight = function(ctx)
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local mini_icon, mini_hl = require("mini.icons").get('file', ctx.label)
                                    if mini_icon then return mini_hl end
                                end
                                return ctx.kind_hl
                            end,
                        }
                    }
                }
            }
        },
        cmdline = { completion = { ghost_text = { enabled = true } } },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
