return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify", -- ya lo tienes en UI.lua
        },
        opts = {
            -- General
            cmdline = { enabled = true }, -- cmdline flotante
            messages = { view = "notify" }, -- usa nvim-notify para mensajes
            history = { limit = 100 }, -- no acumules infinito

            -- LSP (bonito pero sin ruido)
            lsp = {
                progress = { enabled = false }, -- ⚠️ ahorra CPU/ruido
                hover = { enabled = true },
                signature = { enabled = true },
                -- estiliza markdown de LSP/cmp
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },

            -- Presets útiles
            presets = {
                bottom_search = true, -- /? abajo tipo Vim clásico
                command_palette = true, -- cmdline y popup de ayuda juntitos
                long_message_to_split = true, -- mensajes largos a :messages split
                inc_rename = false,   -- si usas inc-rename, actívalo
                lsp_doc_border = true,
            },

            -- Rutas (filtros) para callar ruido común
            routes = {
                -- “X lines yanked/added/written”
                { filter = { event = "msg_show", find = "written" },      opts = { skip = true } },
                { filter = { event = "msg_show", find = "yanked" },       opts = { skip = true } },
                { filter = { event = "msg_show", find = "fewer lines" },  opts = { skip = true } },
                { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
            },

            -- Vistas (ajusta si quieres)
            views = {
                cmdline_popup = {
                    position = { row = 5, col = "50%" },
                    size = { width = 60, height = "auto" },
                },
                mini = { win_options = { winblend = 0 } },
            },

            -- Rendimiento
            throttle = 1000, -- menos repaints
        },
        keys = {
            { "<leader>un", function() require("noice").cmd("dismiss") end,                desc = "Cerrar notificaciones Noice" },
            { "<leader>uh", function() require("noice").cmd("history") end,                desc = "Historial de mensajes" },
            { "<S-Enter>",  function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c",                          desc = "Noice Redirect" },
        },
    },
}
