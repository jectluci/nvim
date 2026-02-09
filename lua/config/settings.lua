require("config.plugins.colorScheme")
require("config.plugins.tree-sitter")
require("config.plugins.icons")
require("config.plugins.neotree")
-- require("lsp-zero")
require("config.plugins.smoothCursor")
require("config.plugins.lualine")
require("notify").setup({
    -- Ancho máximo absoluto
    -- max_width = 80,

    icons = {
        ERROR = " ",
        WARN = " ",
        INFO = " ",
        DEBUG = " ",
        TRACE = "✎ ",
    },
    -- O ancho relativo (p.ej. 50% de la pantalla)
    max_width = function()
        return math.floor(vim.o.columns * 0.35)
    end,

    -- Altura máxima para no taparte el centro
    max_height = function()
        return math.floor(vim.o.lines * 0.3)
    end,

    -- Animación más suave
    stages = "fade",
    -- Duración antes de esfumarse
    timeout = 2000,
    -- Estilo de render (puedes probar "minimal", "compact", etc.)
    render = "minimal",
})
require("config.plugins.lsp")

-- vim.filetype.add({
--     pattern = {
--         [".*%.component%.html"] = "htmlangular", -- Sets the filetype to `angular.html` if it matches the pattern
--     },
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "angular.html",
--     callback = function()
--         vim.treesitter.language.register("angular", "htmlangular") -- Register the filetype with treesitter for the `angular` language/parser
--     end,
-- })

require("window-picker").setup({
    -- when there is only one window available to pick from, use that window
    -- without prompting the user to select
    autoselect_one = true,
    -- whether you want to include the window you are currently on to window
    -- selection or not
    include_current_win = false,
    -- when you go to window selection mode, status bar will show one of
    -- following letters on them so you can use that letter to select the window
    selection_chars = "FJDKSLA;CMRUEIWOQP",
    -- whether you want to use winbar instead of the statusline
    -- "always" means to always use winbar,
    -- "never" means to never use winbar
    -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
    use_winbar = "never", -- "always" | "never" | "smart"
    -- whether to show 'Pick window:' prompt
    show_prompt = true,
    -- if you want to manually filter out the windows, pass in a function that
    -- takes two parameters. you should return window ids that should be
    -- included in the selection
    -- EX:-
    -- function(window_ids, filters)
    --    -- filter the window_ids
    --    -- return only the ones you want to include
    --    return {1000, 1001}
    -- end
    filter_func = nil,
    filter_rules = {
        bo = {
            filetype = { "oil", "notify" },
            buftype = { "terminal" },
        },
        wo = {},
        file_path_contains = {},
        file_name_contains = {},
    },
    fg_color = "#ededed",
    current_win_hl_color = "#e35e4f",
    selection_display = function(char)
        return char
    end,

    autoselect_one = true,
    include_current = false,
    filter_rules = {
        -- filter using buffer options
        bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
        },
    },
    other_win_hl_color = "#e35e4f",
})


vim.opt.termguicolors = true

require("gitsigns").setup({
    signs = {
        add = { text = "" },
        change = { text = "󰑕" },
        delete = { text = "󰗨" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "󰠙" },
    },
    signs_staged = {
        add = { text = "󰴤" },
        change = { text = "󱔽" },
        delete = { text = "󱒼" },
        topdelete = { text = "󱟨" },
        changedelete = { text = "~" },
        untracked = { text = "󰙰" },
    },
    signs_staged_enable = true,
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = { follow_files = true },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
})

-- hlargs: actívalo solo si usas TS y no te hace lag
local ok_hlargs, hlargs = pcall(require, "hlargs")
if ok_hlargs then
    hlargs.setup({
        color = "#ef9062",
        paint_arg_declarations = true,
        paint_arg_usages = true,
        extras = { named_parameters = false },
        hl_priority = 120,
        excluded_argnames = {
            usages = { python = { "self", "cls" }, lua = { "self" } },
        },
        performance = {
            parse_delay = 1,
            slow_parse_delay = 50,
            max_iterations = 400,
            max_concurrent_partial_parses = 30,
            debounce = { partial_parse = 3, partial_insert_mode = 100, total_parse = 700, slow_parse = 5000 },
        },
    })
    hlargs.enable()
end


require("telescope").load_extension("flutter")

-- alternatively you can override the default configs
require("flutter-tools").setup({
    lsp = {
        color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = true, -- highlight the background
            background_color = { r = 19, g = 17, b = 24 }, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
            foreground = true, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
        },
        settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt", -- "always"
            enableSnippets = true,
            updateImportsOnRename = true,      -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
        },
    },
})

require("telescope").load_extension("ui-select")

local trouble = require("trouble")

-- Módulo para mostrar diagnóstico actual (o lo que prefieras)
local trouble_diags = trouble.statusline({
    mode = "diagnostics", -- también: "quickfix", "loclist", "lsp", "symbols"
    title = false,        -- sin título
    padding = { left = 1, right = 1 },
    -- format = "{count} {icon}", -- opcional: personaliza texto
})

require("lualine").setup({
    sections = {
        lualine_x = {
            trouble_diags, -- aparece como un componente más
        },
    },
})

require("lualine").setup({
    sections = {
        lualine_x = {
            { "diagnostics", sources = { "nvim_diagnostic" } }, -- muestra conteos
        },
    },
})

-- Click/atajo para saltar a Trouble cuando quieras:
vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble" })

local telescope = require("telescope")

-- Detecta automáticamente la API según tu versión de trouble
local trouble_open = (function()
    local ok_new, src = pcall(require, "trouble.sources.telescope") -- v3
    if ok_new then
        return src.open
    end
    local ok_old, prov = pcall(require, "trouble.providers.telescope") -- v2
    if ok_old then
        return prov.open_with_trouble
    end
    return nil
end)()

telescope.setup({
    defaults = {
        mappings = {
            i = trouble_open and { ["<C-t>"] = trouble_open } or {},
            n = trouble_open and { ["<C-t>"] = trouble_open } or {},
        },
    },
})

-- Folds básicos recomendados
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

require("ufo").setup({
    provider_selector = function(bufnr, filetype, buftype)
        -- *** Ajusta aquí tu preferencia por defecto ***
        local preferred = { "lsp", "indent" }

        -- Si hay LSP con foldingRange, úsalo primero
        local has_lsp = false
        for _, c in ipairs(vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })) do
            local caps = c.server_capabilities or c.resolved_capabilities
            if caps and (caps.foldingRange or caps.foldingRangeProvider) then
                has_lsp = true
                break
            end
        end

        local out
        if has_lsp then
            out = { "lsp", "indent" } -- main, fallback
        else
            -- si no hay LSP, prueba TS, y si no, indent
            local ok = pcall(require, "nvim-treesitter")
            out = ok and { "treesitter", "indent" } or { "indent" }
        end

        -- *** Cinturón y tirantes: si algo externo mete 3+, recorta a 2 ***
        if #out > 2 then
            out = { out[1], out[2] }
        end
        return out
    end,
})

-- Iluminati

require("illuminate").configure({
    providers = { "lsp", "regex" },
    delay = 120,
    large_file_cutoff = 2000,
    large_file_overrides = { providers = { "lsp" } },
    filetypes_denylist = { "neo-tree", "oil", "TelescopePrompt", "toggleterm", "notify" },
})

-- Usa el mismo estilo que LSP references
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "LspReferenceText" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "LspReferenceRead" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "LspReferenceWrite" })

-- Navegar referencias dentro del buffer
vim.keymap.set("n", "]r", require("illuminate").goto_next_reference, { desc = "Next reference" })
vim.keymap.set("n", "[r", require("illuminate").goto_prev_reference, { desc = "Prev reference" })

-- Trouble
vim.keymap.set("n", "<leader>lr", "<cmd>Trouble lsp_references toggle<CR>", { desc = "Refs en Trouble" })
-- Telescope
vim.keymap.set("n", "gr", function()
    require("telescope.builtin").lsp_references({ include_declaration = false })
end, { desc = "Refs en Telescope" })


local ok, ng = pcall(require, "ng")
if ok then
    local o = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>at", ng.goto_template_for_component, o)
    vim.keymap.set("n", "<leader>ac", ng.goto_component_with_template_file, o)
    vim.keymap.set("n", "<leader>aT", ng.get_template_tcb, o)
end
