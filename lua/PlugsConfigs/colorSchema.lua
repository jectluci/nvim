require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day",    -- The theme is used when the background is set to light
  transparent = false,    -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = { bold = true, underline = true  },
    variables = { italic = true, bold = true },
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark",              -- style for sidebars, see below
    floats = "dark",                -- style for floating windows
  },
  sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false,             -- dims inactive windows
  lualine_bold = true,             -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---param highlights Highlights
  ---param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})
vim.cmd [[colorscheme tokyonight-night]]



require('smoothcursor').setup({
  autostart = true,
  cursor = "", -- cursor shape (need nerd font)
  texthl = "SmoothCursor", -- highlight group, default is { bg = nil, fg = "#FFD400" }
  linehl = nil, -- highlight sub-cursor line like 'cursorline', "CursorLine" recommended
  type = "default", -- define cursor movement calculate function, "default" or "exp" (exponential).
  fancy = {
    enable = true, -- enable fancy mode
    head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
    body = {
      { cursor = "", texthl = "SmoothCursorRed" },
      { cursor = "", texthl = "SmoothCursorOrange" },
      { cursor = "●", texthl = "SmoothCursorYellow" },
      { cursor = "●", texthl = "SmoothCursorGreen" },
      { cursor = "•", texthl = "SmoothCursorAqua" },
      { cursor = ".", texthl = "SmoothCursorBlue" },
      { cursor = ".", texthl = "SmoothCursorPurple" },
    },
    tail = { cursor = nil, texthl = "SmoothCursor" }
  },
  flyin_effect = nil,        -- "bottom" or "top"
  speed = 25,                -- max is 100 to stick to your current position
  intervals = 35,            -- tick interval
  priority = 10,             -- set marker priority
  timeout = 3000,            -- timout for animation
  threshold = 3,             -- animate if threshold lines jump
  disable_float_win = false, -- disable on float window
  enabled_filetypes = nil,   -- example: { "lua", "vim" }
  disabled_filetypes = nil,  -- this option will be skipped if enabled_filetypes is set. example: { "TelescopePrompt", "NvimTree" }
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
