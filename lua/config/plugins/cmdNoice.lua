require("noice").setup({
    lsp = {
        progress = { enabled = false }, -- menos spam y CPU
        hover = { enabled = true },
        signature = { enabled = false },
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    messages = {
        view = ok_notify and "notify" or "mini", -- usa notify si existe
    },
    history = { limit = 100 },                   -- no colecciones pergaminos infinitos
    throttle = 1000,                             -- baja repaints
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false, -- si quieres borde: true
    },
    routes = {
        { filter = { event = "msg_show", find = "written" },      opts = { skip = true } },
        { filter = { event = "msg_show", find = "yanked" },       opts = { skip = true } },
        { filter = { event = "msg_show", find = "fewer lines" },  opts = { skip = true } },
        { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
    },
    views = {
        cmdline_popup = {
            position = { row = 5, col = "50%" },
            size = { width = 60, height = "auto" },
        },
        mini = { win_options = { winblend = 0 } },
    },
})
