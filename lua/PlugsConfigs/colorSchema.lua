-- Default options:
-- Example config in Lua
--
-- Default options:
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    -- flavour = "auto" -- will respect terminal's background
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.2, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = { "bold" },
        keywords = { "bold" , "altfont" },
        strings = { "italic" },
        variables = { "italic" },
        numbers = {},
        booleans = {'bold'},
        properties = {'bold','italic'},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

local latte = require("catppuccin.palettes").get_palette "latte"
local frappe = require("catppuccin.palettes").get_palette "frappe"
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local mocha = require("catppuccin.palettes").get_palette "mocha"

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

require('smoothcursor').setup({
    type = "default",           -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".

    cursor = "",              -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
    texthl = "SmoothCursor",   -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
    linehl = nil,              -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.

    matrix = {  -- Loaded when 'type' is set to "matrix"
        head = {
            -- Picks a random character from this list for the cursor text
            cursor = require('smoothcursor.matrix_chars'),
            -- Picks a random highlight from this list for the cursor text
            texthl = {
                'SmoothCursor',
            },
            linehl = nil,  -- No line highlight for the head
        },
        body = {
            length = 6,  -- Specifies the length of the cursor body
            -- Picks a random character from this list for the cursor body text
            cursor = require('smoothcursor.matrix_chars'),
            -- Picks a random highlight from this list for each segment of the cursor body
            texthl = {
                'SmoothCursorGreen',
            },
        },
        tail = {
            -- Picks a random character from this list for the cursor tail (if any)
            cursor = nil,
            -- Picks a random highlight from this list for the cursor tail
            texthl = {
                'SmoothCursor',
            },
        },
        unstop = false,  -- Determines if the cursor should stop or not (false means it will stop)
    },

    autostart = true,           -- Automatically start SmoothCursor
    always_redraw = true,       -- Redraw the screen on each update
    flyin_effect = nil,         -- Choose "bottom" or "top" for flying effect
    speed = 25,                 -- Max speed is 100 to stick with your current position
    intervals = 35,             -- Update intervals in milliseconds
    priority = 10,              -- Set marker priority
    timeout = 3000,             -- Timeout for animations in milliseconds
    threshold = 3,              -- Animate only if cursor moves more than this many lines
    disable_float_win = false,  -- Disable in floating windows
    enabled_filetypes = nil,    -- Enable only for specific file types, e.g., { "lua", "vim" }
    disabled_filetypes = nil,   -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
    -- Show the position of the latest input mode positions. 
    -- A value of "enter" means the position will be updated when entering the mode.
    -- A value of "leave" means the position will be updated when leaving the mode.
    -- `nil` = disabled
    show_last_positions = nil,  
})

local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'ModeChanged' }, {
  callback = function()
    local current_mode = vim.fn.mode()
    if current_mode == 'n' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })
      vim.fn.sign_define('smoothcursor', { text = '' })
    elseif current_mode == 'v' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
      vim.fn.sign_define('smoothcursor', { text = '' })
    elseif current_mode == 'V' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
      vim.fn.sign_define('smoothcursor', { text = '' })
    elseif current_mode == '�' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
      vim.fn.sign_define('smoothcursor', { text = '' })
    elseif current_mode == 'i' then
      vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#668aab' })
      vim.fn.sign_define('smoothcursor', { text = '' })
    end
  end,
})

