-- Default options:
require("onedarkpro").setup({
    colors = {},     -- Override default colors or create your own
    highlights = {}, -- Override default highlight groups or create your own
    styles = {
        types = "bold",
        methods = "bold,italic",
        numbers = "bold",
        strings = "italic",
        comments = "italic",
        keywords = "bold",
        constants = "bold,italic",
        functions = "bold",
        operators = "NONE",
        variables = "NONE",
        parameters = "italic",
        conditionals = "bold,italic",
        virtual_text = "italic",
    },
    options = {
        cursorline = true,                 -- Use cursorline highlighting?
        transparency = false,              -- Use a transparent background?
        terminal_colors = true,            -- Use the theme's colors for Neovim's :terminal?
        lualine_transparency = false,      -- Center bar transparency?
        highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
    }
})


vim.cmd("colorscheme vaporwave")
