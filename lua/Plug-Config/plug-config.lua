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

-----Nerdtree
---- following options are the default
-- require'nvim-tree'.setup {
--  -- disables netrw completely
--  disable_netrw       = true,
--  -- hijack netrw window on startup
--  hijack_netrw        = true,
--  -- open the tree when running this setup function
--  open_on_setup       = false,
--  -- will not open on setup if the filetype is in this list
--  ignore_ft_on_setup  = {},
--  -- closes neovim automatically when the tree is the last **WINDOW** in the view
--  auto_close          = false,
--  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
--  open_on_tab         = true,
--  -- hijacks new directory buffers when they are opened.
--  update_to_buf_dir   = {
--    -- enable the feature
--    enable = true,
--    -- allow to open the tree if it was previously closed
--    auto_open = true,
--  },
--  -- hijack the cursor in the tree to put it at the start of the filename
--  hijack_cursor       = false,
--  -- updates the root directory of the tree on `DirChanged` (when you run `:cd` usually)
--  update_cwd          = false,
--  -- show lsp diagnostics in the signcolumn
--  diagnostics = {
--    enable = false,
--    icons = {
--      hint = "",
--      info = "",
--      warning = "",
--      error = "",
--    }
--  },
--  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
--  update_focused_file = {
--    -- enables the feature
--    enable      = false,
--    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
--    -- only relevant when `update_focused_file.enable` is true
--    update_cwd  = false,
--    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
--    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
--    ignore_list = {}
--  },
--  -- configuration options for the system open command (`s` in the tree by default)
--  system_open = {
--    -- the command to run this, leaving nil should work in most cases
--    cmd  = nil,
--    -- the command arguments as a list
--    args = {}
--  },
--
--  view = {
--    -- width of the window, can be either a number (columns) or a string in `%`, for left or right side placement
--    width = 30,
--    -- height of the window, can be either a number (columns) or a string in `%`, for top or bottom side placement
--    height = 30,
--    -- Hide the root path of the current folder on top of the tree
--    hide_root_folder = false,
--    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
--    side = 'right',
--    -- if true the tree will resize itself after opening a file
--    auto_resize = false,
--    mappings = {
--      -- custom only false will merge the list with the default mappings
--      -- if true, it will only use your list to set the mappings
--      custom_only = false,
--      -- list of mappings to set on the tree manually
--      list = {}
--    }
--  }
--}
--
--vim.cmd('nnoremap <F2> :NvimTreeToggle<CR>')
----vim.cmd('nnoremap  :NvimTreeRefresh<CR>')
--

--LspConfig
require'lspconfig'.pyright.setup{}
--require'lspconfig'.rust_analyzer.setup{}
--require'lspconfig'.zls.setup{}
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.yamlls.setup{}
--require'lspconfig'.vimls.setup{}


--LspConfig color
-- Lua
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})


--Rainbow
require("nvim-treesitter.configs").setup {
  highlight = {
      -- ...
  },
  -- ...
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

--Inden
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}


--flutter
require("flutter-tools").setup{} -- use defaults


