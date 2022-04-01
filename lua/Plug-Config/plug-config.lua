--THemes

--lualine
require('lualine').setup {
  options = {
   icons_enabled = true,
    theme = 'dracula-nvim',
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
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
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
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
-- require'lspconfig'.java_language_server.setup{}


--LspConfig color
-- Lua
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {}, -- table of hex strings
    termcolors = {} -- table of colour name strings
  }
}


----Indent
--vim.opt.list = true
--vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
   show_current_context_start = true,
--    space_char_blankline = " ",
--    show_current_context = true,
}


--flutter
require("flutter-tools").setup{} -- use defaults



