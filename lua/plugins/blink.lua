return {
    'saghen/blink.cmp',
    dependencies = {
        { "L3MON4D3/LuaSnip",             lazy = true },
        { "rafamadriz/friendly-snippets", lazy = true },
        { 'nvim-mini/mini.nvim',          version = '*' },
        "onsails/lspkind.nvim",
    },
    version = '1.*',
    opts = {
        keymap = {
            preset        = "none",
            ["<C-Space>"] = { "show", "show_documentation" },
            ["<C-e>"]     = { "hide" },
            ["<CR>"]      = { "accept", "fallback" },
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
            trigger = {
                show_on_keyword = true,
                show_on_trigger_character = true,
                show_on_insert_on_trigger_character = true,
                -- ❌ debounce_ms removido, no existe en este nivel
            },
            keyword = { range = 'full' },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = {
                    border = 'rounded', -- ✅ esto fija la doc al costado
                },
            },
            menu = {
                border = 'rounded', -- ✅ borde en el menú también
                draw = {
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local mini_icon, _ = require("mini.icons").get('file', ctx.label)
                                    if mini_icon then return mini_icon .. ctx.icon_gap end
                                end
                                local lspkind_ok, lspkind = pcall(require, "lspkind")
                                if lspkind_ok and lspkind.symbolic then
                                    local icon = lspkind.symbolic(ctx.kind, { mode = "symbol" })
                                    if icon then return icon .. ctx.icon_gap end
                                end
                                return ctx.kind_icon .. ctx.icon_gap
                            end,
                            highlight = function(ctx)
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local _, mini_hl = require("mini.icons").get('file', ctx.label)
                                    if mini_hl then return mini_hl end
                                end
                                return ctx.kind_hl
                            end,
                        },
                        kind = {
                            highlight = function(ctx)
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local _, mini_hl = require("mini.icons").get('file', ctx.label)
                                    if mini_hl then return mini_hl end
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
            providers = {
                snippets = {
                    opts = { search_paths = { vim.fn.stdpath('data') .. '/lazy/friendly-snippets' } }
                },
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" }
}
