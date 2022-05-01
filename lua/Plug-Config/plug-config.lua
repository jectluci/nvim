--THemes
--Global Settings
vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
vim.opt_global.shortmess:remove("F"):append("c")
-- Lua:
vim.cmd[[colorscheme dracula]]
-- customize dracula color palette
vim.g.dracula_colors = {
  bg = "#282A36",
  fg = "#F8F8F2",
  selection = "#44475A",
  comment = "#6272A4",
  red = "#FF5555",
  orange = "#FFB86C",
  yellow = "#F1FA8C",
  green = "#50fa7b",
  purple = "#BD93F9",
  cyan = "#8BE9FD",
  pink = "#FF79C6",
  bright_red = "#FF6E6E",
  bright_green = "#69FF94",
  bright_yellow = "#FFFFA5",
  bright_blue = "#D6ACFF",
  bright_magenta = "#FF92DF",
  bright_cyan = "#A4FFFF",
  bright_white = "#FFFFFF",
  menu = "#21222C",
  visual = "#3E4452",
  gutter_fg = "#4B5263",
  nontext = "#3B4048",
}
-- show the '~' characters after the end of buffers
vim.g.dracula_show_end_of_buffer = true
-- use transparent background
vim.g.dracula_transparent_bg = true
-- set custom lualine background color
-- vim.g.dracula_lualine_bg_color = "#44475a"
-- set italic comment
vim.g.dracula_italic_comment = true

--lualine
require('lualine').setup {
  options = {
   icons_enabled = true,
    theme = 'dracula-nvim',
    section_separators = { left = '', right = ''},
    component_separators = {left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
--Tabbar
vim.opt.termguicolors = true
require('luatab').setup{}



---Icons
require("nvim-web-devicons").set_default_icon('', '#6d8086')
require'nvim-web-devicons'.setup {
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  },
  angular={
    icon = "",
    color = "#E23237"
  },
  git={
    icon = "",
    color = "#F14C28",
    cterm_color = "202",
    name = "GitLogo",
  }
 };
 defaults = true;
}

require("nvim-web-devicons").set_icon{
  htm={
    icon="",
    color = "#428850",
    cterm_color = "65",
    name = "Htm",
  },
  html={
    icon="",
    color = "#428850",
    cterm_color = "65",
    name = "Html",
  }
}

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
    disable = { "css" }
  },
  rainbow = {
    enable = true,
    disable={"html"},
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    --colors = {}, -- table of hex strings
    --termcolors = {} -- table of colour name strings
  }
}



require("indent_blankline").setup {
   show_current_context_start = true,
--    space_char_blankline = " ",
   show_current_context = true,
}



--flutter
require("flutter-tools").setup{} -- use defaults

---DBUI
vim.g.db_ui_use_nerd_fonts = 1


