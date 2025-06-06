-- Set colorscheme after options
-- require("tokyonight").setup({
--   -- use the night style
--  style = "moon", -- o "night", "storm", "day"
--     transparent = false,
--     terminal_colors = true,
--     styles = {
--       keywords = { italic = true },
--       functions = { bold = true },
--       comments = { italic = true },
--       variables = {},
--     },
--     on_highlights = function(hl, c)
--       hl["@lsp.type.keyword"]       = { fg = c.magenta, bold = true }
--       hl["@lsp.type.namespace"]     = { fg = c.blue, italic = true }
--       hl["@lsp.type.function"]      = { fg = c.cyan, bold = true }
--       hl["@lsp.type.method"]        = { fg = c.green, italic = true }
--       hl["@lsp.type.class"]         = { fg = c.orange, bold = true }
--       hl["@lsp.type.parameter"]     = { fg = c.yellow }
--       hl["@lsp.typemod.function.defaultLibrary"] = { fg = c.blue }
--     end,
-- })


-- vim.cmd[[colorscheme tokyonight]]
--
--
-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = { undercurl = true },
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "dragon",              -- Load "wave" theme
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
