return {
    'saghen/blink.cmp',
    dependencies = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets", -- opcional
    },

    version = '1.*',
    opts = {
        keymap = {
            preset        = "none",

            -- Abrir/actualizar menú y docs
            ["<C-Space>"] = { "show", "show_documentation" },
            ["<C-e>"]     = { "hide" },

            -- Confirmar como en nvim-cmp
            ["<CR>"]      = { "accept", "fallback" },

            -- SuperTab + LuaSnip
            ["<Tab>"]     = { "select_next", "snippet_forward", "fallback" },
            ["<S-Tab>"]   = { "select_prev", "snippet_backward", "fallback" },

            -- También C-n / C-p
            ["<C-n>"]     = { "select_next", "fallback" },
            ["<C-p>"]     = { "select_prev", "fallback" },

            -- >>> FIX flechas: navegar el popup sin cerrarlo <<<
            ["<Down>"]    = { "select_next", "show" }, -- evita mover el cursor
            ["<Up>"]      = { "select_prev", "show" },

            -- Scroll de documentación
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
                                    local mini_icon, _ = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                                    if mini_icon then return mini_icon .. ctx.icon_gap end
                                end

                                local icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
                                return icon .. ctx.icon_gap
                            end,

                            highlight = function(ctx)
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local mini_icon, mini_hl = require("mini.icons").get_icon(ctx.item.data.type,
                                        ctx.label)
                                    if mini_icon then return mini_hl end
                                end
                                return ctx.kind_hl
                            end,
                        },
                        kind = {
                            highlight = function(ctx)
                                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                    local mini_icon, mini_hl = require("mini.icons").get_icon(ctx.item.data.type,
                                        ctx.label)
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
