----THemes
----Global Settings
--vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
--vim.opt_global.shortmess:remove("F"):append("c")
---- Lua:
--vim.cmd[[colorscheme dracula]]
---- customize dracula color palette
--vim.g.dracula_colors = {
--  bg = "#282A36",
--  fg = "#F8F8F2",
--  selection = "#44475A",
--  comment = "#6272A4",
--  red = "#FF5555",
--  orange = "#FFB86C",
--  yellow = "#F1FA8C",
--  green = "#50fa7b",
--  purple = "#BD93F9",
--  cyan = "#8BE9FD",
--  pink = "#FF79C6",
--  bright_red = "#FF6E6E",
--  bright_green = "#69FF94",
--  bright_yellow = "#FFFFA5",
--  bright_blue = "#D6ACFF",
--  bright_magenta = "#FF92DF",
--  bright_cyan = "#A4FFFF",
--  bright_white = "#FFFFFF",
--  menu = "#21222C",
--  visual = "#3E4452",
--  gutter_fg = "#4B5263",
--  nontext = "#3B4048",
--}
---- show the '~' characters after the end of buffers
--vim.g.dracula_show_end_of_buffer = true
---- use transparent background
--vim.g.dracula_transparent_bg = true
---- set custom lualine background color
---- vim.g.dracula_lualine_bg_color = "#44475a"
---- set italic comment
--vim.g.dracula_italic_comment = true

--lualine
-- require('lualine').setup {
--   options = {
--    icons_enabled = true,
--     theme = 'gruvbox',
--     section_separators = { left = '', right = ''},
--     component_separators = {left = '', right = ''},
--     disabled_filetypes = {},
--     always_divide_middle = true
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {}
-- }

-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)


--
--Tabbar
vim.opt.termguicolors = true
require('luatab').setup{}



---Icons
-- require("nvim-web-devicons").set_default_icon('', '#6d8086')
-- require'nvim-web-devicons'.setup {
--  override = {
--   zsh = {
--     icon = "",
--     color = "#428850",
--     name = "Zsh"
--   },
--   angular={
--     icon = "",
--     color = "#E23237"
--   },
--   git={
--     icon = "",
--     color = "#F14C28",
--     cterm_color = "202",
--     name = "GitLogo",
--   }
--  };
--  defaults = true;
-- }

-- require("nvim-web-devicons").set_icon{
--   htm={
--     icon="",
--     color = "#428850",
--     cterm_color = "65",
--     name = "Htm",
--   },
--   html={
--     icon="",
--     color = "#428850",
--     cterm_color = "65",
--     name = "Html",
--   }
-- }

require'nvim-web-devicons'.has_loaded()



--Icons Nerdtree

require'nvim-web-devicons'.get_icons()


--LspConfig
require'lspconfig'.pyright.setup{}
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.cssmodules_ls.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.cssmodules_ls.setup{}
require'lspconfig'.java_language_server.setup{}


--LspConfig color
-- Lua
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

require'nvim-treesitter.configs'.setup {
  highlight={
    enable = true,
    disable = { "css","html" }
  },
  rainbow = {
    enable = false,
    disable={"html"},
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {}, -- table of hex strings
    termcolors = {} -- table of colour name strings
  }
}



vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
}


--flutter
-- require("flutter-tools").setup{} -- use defaults

---DBUI
vim.g.db_ui_use_nerd_fonts = 1


--impatient
require'impatient'.enable_profile()

