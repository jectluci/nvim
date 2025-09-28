return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',
    opts = {
        keymap = {
            -- set to 'none' to disable the 'default' preset
            preset = 'default',

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },

            -- disable a keymap from the preset
            ['<C-e>'] = false, -- or {}

            -- show with a list of providers
            ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },

            -- control whether the next command will be run when using a function
            ['<C-n>'] = {
                function(cmp)
                    if some_condition then return end -- runs the next command
                    return true                       -- doesn't run the next command
                end,
                'select_next'
            },
        },
        appearance = {
            nerd_font_variant = 'mono'
        },

        completion = { documentation = { auto_show = false } },
        cmdline = { completion = { ghost_text = { enabled = true } } },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
