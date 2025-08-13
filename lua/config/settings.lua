require("config.plugins.colorScheme")
require("config.plugins.tree-sitter")
require('config.plugins.icons')
require("config.plugins.neotree")
require('lsp-zero')
require('config.plugins.smoothCursor')
require("config.plugins.lualine")
require("notify").setup({
    -- Ancho máximo absoluto
    -- max_width = 80,

    icons = {
        ERROR = " ",
        WARN  = " ",
        INFO  = " ",
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

vim.filetype.add({
    pattern = {
        [".*%.component%.html"] = "angular.html", -- Sets the filetype to `angular.html` if it matches the pattern
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "angular.html",
    callback = function()
        vim.treesitter.language.register("angular", "angular.html") -- Register the filetype with treesitter for the `angular` language/parser
    end,
})



require 'window-picker'.setup({
    -- when there is only one window available to pick from, use that window
    -- without prompting the user to select
    autoselect_one = true,
    -- whether you want to include the window you are currently on to window
    -- selection or not
    include_current_win = false,
    -- when you go to window selection mode, status bar will show one of
    -- following letters on them so you can use that letter to select the window
    selection_chars = 'FJDKSLA;CMRUEIWOQP',
    -- whether you want to use winbar instead of the statusline
    -- "always" means to always use winbar,
    -- "never" means to never use winbar
    -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
    use_winbar = 'never', -- "always" | "never" | "smart"
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
    -- following filters are only applied when you are using the default filter
    -- defined by this plugin. if you pass in a function to "filter_func"
    -- property, you are on your own
    filter_rules = {
        -- filter using buffer options
        bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "oil", "notify" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { 'terminal' },
        },

        -- filter using window options
        wo = {},

        -- if the file path contains one of following names, the window
        -- will be ignored
        file_path_contains = {},

        -- if the file name contains one of following names, the window will be
        -- ignored
        file_name_contains = {},
    },
    -- the foreground (text) color of the picker
    fg_color = '#ededed',
    -- if you have include_current_win == true, then current_win_hl_color will
    -- be highlighted using this background color
    current_win_hl_color = '#e35e4f',
    -- all the windows except the curren window will be highlighted using this
    -- color
    other_win_hl_color = '#44cc41',
    -- You can change the display string in status bar.
    -- It supports '%' printf style. Such as `return char .. ': %f'` to display
    -- buffer filepath. See :h 'stl' for details.
    selection_display = function(char) return char end,

    autoselect_one = true,
    include_current = false,
    filter_rules = {
        -- filter using buffer options
        bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { 'neo-tree', "neo-tree-popup", "notify" },

            -- if the buffer type is one of following, the window will be ignored
            buftype = { 'terminal', "quickfix" },
        },
    },
    other_win_hl_color = '#e35e4f',
})



-- local lsp_component = {
--   function()
--     local bufnr = vim.api.nvim_get_current_buf()
--     local clients = vim.lsp.get_active_clients()

--     if next(clients) == nil then
--       return ''
--     end

--     local client_name = clients[bufnr] and clients[bufnr].name or 'LSP'
--     return 'LSP: ' .. client_name
--   end,
--   color = { fg = '#ff8800', gui = 'bold' }, -- Personaliza el color
-- }




vim.opt.termguicolors = true
-- require("bufferline").setup {
--   options = {
--     mode = "tabs",
--     numbers = "ordinal",
--     diagnostics = "nvim_lsp"
--   }
-- }
-- vim.g.user_emmet_mode = 'n'
-- vim.g.user_emmet_mode = 'inv'
-- vim.g.user_emmet_mode = 'a'

-- vim.g.user_emmet_install_global = 0
-- vim.cmd("autocmd FileType html,css,js,angular  EmmetInstall")

-- require("telescope").load_extension("refactoring")




require('gitsigns').setup({
    signs = {
        add          = { text = '' },
        change       = { text = '󰑕' },
        delete       = { text = '󰗨' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '󰠙' },
    },
    signs_staged = {
        add          = { text = '󰴤' },
        change       = { text = '󱔽' },
        delete       = { text = '󱒼' },
        topdelete    = { text = '󱟨' },
        changedelete = { text = '~' },
        untracked    = { text = '󰙰' },
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
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    max_file_length = 40000,
    preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
    },
})



-- hlargs: actívalo solo si usas TS y no te hace lag
local ok_hlargs, hlargs = pcall(require, 'hlargs')
if ok_hlargs then
    hlargs.setup({
        color = '#ef9062',
        paint_arg_declarations = true,
        paint_arg_usages = true,
        extras = { named_parameters = false },
        hl_priority = 120,
        excluded_argnames = {
            usages = { python = { 'self', 'cls' }, lua = { 'self' } }
        },
        performance = {
            parse_delay = 1,
            slow_parse_delay = 50,
            max_iterations = 400,
            max_concurrent_partial_parses = 30,
            debounce = { partial_parse = 3, partial_insert_mode = 100, total_parse = 700, slow_parse = 5000 }
        }
    })
    hlargs.enable()
end



-- vim.g.popui_border_style = "rounded"
-- vim.ui.select = require"popui.ui-overrider"
-- vim.ui.input = require"popui.input-overrider"
-- vim.api.nvim_set_keymap("n", ",d", ':lua require"popui.diagnostics-navigator"()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", ",m", ':lua require"popui.marks-manager"()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", ",r", ':lua require"popui.references-navigator"()<CR>', { noremap = true, silent = true })



-- Lua
vim.keymap.set("n", "<leader>m", require("grapple").toggle)
vim.keymap.set("n", "<leader>M", require("grapple").toggle_tags)

-- User command
vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>")

require("telescope").load_extension("grapple")

-- Lualine + Grapple
pcall(function()
    require("lualine").setup({
        sections = { lualine_b = { "grapple" } },
    })
end)


require("telescope").load_extension("flutter")

-- alternatively you can override the default configs
require("flutter-tools").setup {
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
        }
    }
}



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
    local ok_new, src = pcall(require, "trouble.sources.telescope")    -- v3
    if ok_new then return src.open end
    local ok_old, prov = pcall(require, "trouble.providers.telescope") -- v2
    if ok_old then return prov.open_with_trouble end
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
vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        -- *** Ajusta aquí tu preferencia por defecto ***
        local preferred = { 'lsp', 'treesitter', 'indent' }

        -- Si hay LSP con foldingRange, úsalo primero
        local has_lsp = false
        for _, c in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
            local caps = c.server_capabilities or c.resolved_capabilities
            if caps and (caps.foldingRange or caps.foldingRangeProvider) then
                has_lsp = true
                break
            end
        end

        local out
        if has_lsp then
            out = { 'lsp', 'indent' } -- main, fallback
        else
            -- si no hay LSP, prueba TS, y si no, indent
            local ok = pcall(require, 'nvim-treesitter')
            out = ok and { 'treesitter', 'indent' } or { 'indent' }
        end

        -- *** Cinturón y tirantes: si algo externo mete 3+, recorta a 2 ***
        if #out > 2 then
            out = { out[1], out[2] }
        end
        return out
    end,
})
