require("config.plugins.tree-sitter")
require('config.plugins.icons')
require("config.plugins.neotree")
require('lsp-zero')
require('config.plugins.smoothCursor')
require("config.plugins.lualine")
require("notify").setup()
require("config.plugins.lsp")
require('refactoring').setup({})

local nonicons_extention = require("nvim-nonicons.extentions.nvim-notify")

require("notify").setup({
  icons = nonicons_extention.icons,
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
})

require 'window-picker'.setup({
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
require("bufferline").setup {
  options = {
    mode = "tabs",
    numbers = "ordinal",
    diagnostics = "nvim_lsp"
  }
}
vim.g.user_emmet_mode = 'n'
vim.g.user_emmet_mode = 'inv'
vim.g.user_emmet_mode = 'a'

vim.g.user_emmet_install_global = 0
vim.cmd("autocmd FileType html,css,js,angular  EmmetInstall")

require("telescope").load_extension("refactoring")




require('gitsigns').setup {
  signs                        = {
    add          = { text = '' },
    change       = { text = '󰑕' },
    delete       = { text = '󰗨' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl                        = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir                 = {
    follow_files = true
  },
  auto_attach                  = true,
  attach_to_untracked          = false,
  current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts      = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority                = 6,
  update_debounce              = 100,
  status_formatter             = nil, -- Use default
  max_file_length              = 40000, -- Disable if file is longer than this (in lines)
  preview_config               = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm= {
    enable = false
  },
}


vim.keymap.set('n', ',q', function()
  local pattern = _G._rest_nvim.env_pattern
  local command = string.format("fd -HI '%s'", pattern)
  local result = io.popen(command):read('*a')

  local env_list = {}
  for line in result:gmatch('[^\r\n]+') do
    table.insert(env_list, line)
  end

  local rest_functions = require('rest-nvim.functions')

  vim.ui.select(env_list, {
    prompt = 'Select env file ',
    format_item = function(item)
      return item
    end,
  }, function(choice)
    if choice == nil then
      return
    end
    rest_functions.env('set', choice)
  end)
end, { desc = '[q]uery envs' })

require('hlargs').setup {
  color = '#ef9062',
  highlight = {},
  excluded_filetypes = {},
  -- disable = function(lang, bufnr) -- If changed, `excluded_filetypes` will be ignored
  --   return vim.tbl_contains(opts.excluded_filetypes, lang)
  -- end,
  paint_arg_declarations = true,
  paint_arg_usages = true,
  paint_catch_blocks = {
    declarations = false,
    usages = false
  },
  extras = {
    named_parameters = false,
  },
  hl_priority = 120,
  excluded_argnames = {
    declarations = {},
    usages = {
      python = { 'self', 'cls' },
      lua = { 'self' }
    }
  },
  performance = {
    parse_delay = 1,
    slow_parse_delay = 50,
    max_iterations = 400,
    max_concurrent_partial_parses = 30,
    debounce = {
      partial_parse = 3,
      partial_insert_mode = 100,
      total_parse = 700,
      slow_parse = 5000
    }
  }
}
-- (You may omit the settings whose defaults you're ok with)
require('hlargs').enable()
-- require('hlargs').disable()
-- require('hlargs').toggle()
