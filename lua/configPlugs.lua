---@diagnostic disable: unused-local, undefined-global

---PlugsConfigs
require('PlugsConfigs.colorSchema')
require('PlugsConfigs.lualine')
require('PlugsConfigs.lspConfigs')

--NeoTree
-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
  { text = "󰻸", texthl = "DiagnosticSignHint" })
-- NOTE: this is changed from v1.x, which used the old style of highlight groups
-- in the form "LspDiagnosticsSignWarning"
require("neo-tree").setup({
  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  sort_case_insensitive = false, -- used when sorting files and directories in the tree
  sort_function = nil,           -- use a custom function for sorting files and directories in the tree
  -- sort_function = function (a,b)
  --       if a.type == b.type then
  --           return a.path > b.path
  --       else
  --           return a.type > b.type
  --       end
  --   end , -- this sorts files and directories descendantly
  default_component_configs = {
    container = {
      enable_character_fade = true
    },
    indent = {
      indent_size = 1,
      padding = 3, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "ﰊ",
      -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      -- then these will never be used.
      default = "*",
      highlight = "NeoTreeFileIcon"
    },
    modified = {
      symbol = "[+]",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "✖", -- this can only be used in the git_status source
        renamed   = "", -- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
  },
  window = {
    position = "left",
    width = 30,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<20>"] = {
        "toggle_node",
        nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
      },
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = "open",
      ["<esc>"] = "revert_preview",
      ["P"] = { "toggle_preview", config = { use_float = true } },
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      -- ["S"] = "split_with_window_picker",
      -- ["s"] = "vsplit_with_window_picker",
      ["t"] = "open_tabnew",
      -- ["<cr>"] = "open_drop",
      -- ["t"] = "open_tab_drop",
      ["w"] = "open_with_window_picker",
      --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
      ["C"] = "close_node",
      ["z"] = "close_all_nodes",
      --["Z"] = "expand_all_nodes",
      ["a"] = {
        "add",
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "none" -- "none", "relative", "absolute"
        }
      },
      ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
      -- ["c"] = {
      --  "copy",
      --  config = {
      --    show_path = "none" -- "none", "relative", "absolute"
      --  }
      --}
      ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
    }
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
        --"node_modules"
      },
      hide_by_pattern = { -- uses glob style patterns
        --"*.meta",
        --"*/src/*/tsconfig.json",
      },
      always_show = { -- remains visible even if other settings would normally hide it
        --".gitignored",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        --".DS_Store",
        --"thumbs.db"
      },
      never_show_by_pattern = { -- uses glob style patterns
        --".null-ls_*",
      },
    },
    follow_current_file = true,             -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = false,               -- when true, empty folders will be grouped together
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",  -- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["D"] = "fuzzy_finder_directory",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["[g"] = "prev_git_modified",
        ["]g"] = "next_git_modified",
      }
    }
  },
  buffers = {
    follow_current_file = true, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = true,    -- when true, empty folders will be grouped together
    show_unloaded = true,
    window = {
      mappings = {
        ["bd"] = "buffer_delete",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
      }
    },
  },
  git_status = {
    window = {
      position = "float",
      mappings = {
        ["A"]  = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      }
    }
  }
})

vim.cmd([[nnoremap \ :Neotree reveal<cr>]])

vim.keymap.set('n', "<F2>", ':Neotree reveal<cr>')
vim.keymap.set('n', "<F3>", ':Neotree close<cr>')



local highlights = require("neo-tree.ui.highlights")

require("neo-tree").setup({
  filesystem = {
    components = {
      icon = function(config, node, state)
        local icon = config.default or ""
        local padding = config.padding or ""
        local highlight = config.highlight or highlights.FILE_ICON

        if node.type == "directory" then
          highlight = highlights.DIRECTORY_ICON
          if node:is_expanded() then
            icon = config.folder_open or ""
          else
            icon = config.folder_closed or ""
          end
          if node.name == ".git" then
            icon = ""
            highlight = highlights.DIRECTORY_ICON
          elseif node.name == "node_modules" then
            icon = "󰎙"
            highlight = highlights.DIRECTORY_ICON
          elseif node.name == "app" then
            icon = "󱋣"
          elseif node.name == ".vim" then
            icon = ""
          elseif node.name == "service" or node.name == "services" then
            icon = "󰡰"
          end
        elseif node.type == "file" then
          local success, web_devicons = pcall(require, "nvim-web-devicons")
          if success then
            local devicon, hl = web_devicons.get_icon(node.name, node.ext)
            icon = devicon or icon
            highlight = hl or highlight
          end
        end

        return {
          text = icon .. padding,
          highlight = highlight,
        }
      end,
    }
  }
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
      filetype = { 'NvimTree', "neo-tree", "notify" },

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

local icons = require "nvim-nonicons"

icons.get("file")


require 'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  },
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true,
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
  -- globally enable "strict" selection of icons - icon will be looked up in
  -- different tables, first by filename, and if not found by extension; this
  -- prevents cases when file doesn't have any extension but still gets some icon
  -- because its name happened to match some extension (default to false)
  strict = true,
  -- same as `override` but specifically for overrides by filename
  -- takes effect when `strict` is true
  override_by_filename = {
    [".gitignore"] = {
      icon = "",
      color = "#f1502f",
      name = "Gitignore"
    }
  },
  -- same as `override` but specifically for overrides by extension
  -- takes effect when `strict` is true
  override_by_extension = {
    ["log"] = {
      icon = "",
      color = "#81e043",
      name = "Log"
    }
  },
}


require 'nvim-web-devicons'.has_loaded()



require "nvim-web-devicons".get_icons()



local web_devicons_ok, web_devicons = pcall(require, "nvim-web-devicons")
if not web_devicons_ok then
  return
end

local material_icon_ok, material_icon = pcall(require, "nvim-material-icon")
if not material_icon_ok then
  return
end

web_devicons.setup({
  override = material_icon.get_icons(),
})


require 'nvim-material-icon'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  },
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true,
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
}
require 'nvim-material-icon'.has_loaded()

require("nvim-material-icon").get_icon_by_filetype(filetype, opts)
require("nvim-material-icon").get_icon_colors_by_filetype(filetype, opts)
require("nvim-material-icon").get_icon_color_by_filetype(filetype, opts)
require("nvim-material-icon").get_icon_cterm_color_by_filetype(filetype, opts)

require("nvim-web-devicons").set_default_icon('', '#6d8086', 65)

--Icons Nerdtree

require 'nvim-web-devicons'.get_icons()


require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = { "html" }
  },
  rainbow = {
    enable = true,
    disable = { "html" },
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {},          -- table of hex strings
    termcolors = {}       -- table of colour name strings
  },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = { "html" , "xml" },
  }
  
}
--Indent
require("ibl").setup()

--Plugin prettier
-- vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")



vim.g.user_emmet_mode = 'n'
vim.g.user_emmet_mode = 'inv'
vim.g.user_emmet_mode = 'a'

vim.g.user_emmet_install_global = 0
vim.cmd("autocmd FileType html,css EmmetInstall")


----COC
---- Some servers have issues with backup files, see #649
--vim.opt.backup = false
--vim.opt.writebackup = false

---- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
---- delays and poor user experience
--vim.opt.updatetime = 300

---- Always show the signcolumn, otherwise it would shift the text each time
---- diagnostics appeared/became resolved
--vim.opt.signcolumn = "yes"

--local keyset = vim.keymap.set
---- Autocomplete
--function _G.check_back_space()
--  local col = vim.fn.col('.') - 1
--  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
--end

---- Use Tab for trigger completion with characters ahead and navigate
---- NOTE: There's always a completion item selected by default, you may want to enable
---- no select by setting `"suggest.noselect": true` in your configuration file
---- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
---- other plugins before putting this into your config
--local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
--keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
--keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

---- Make <CR> to accept selected completion item or notify coc.nvim to format
---- <C-g>u breaks current undo, please make your own choice
--keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

---- Use <c-j> to trigger snippets
--keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
---- Use <c-space> to trigger completion
---- keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })
--keyset("i", "zxc", "coc#refresh()", { silent = true, expr = true })

---- Use `[g` and `]g` to navigate diagnostics
---- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
--keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
--keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

---- GoTo code navigation
--keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
--keyset("n", "gy", "<Plug>(coc-type-definition)", { silent = true })
--keyset("n", "gi", "<Plug>(coc-implementation)", { silent = true })
--keyset("n", "gr", "<Plug>(coc-references)", { silent = true })


---- Use K to show documentation in preview window
--function _G.show_docs()
--  local cw = vim.fn.expand('<cword>')
--  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
--    vim.api.nvim_command('h ' .. cw)
--  elseif vim.api.nvim_eval('coc#rpc#ready()') then
--    vim.fn.CocActionAsync('doHover')
--  else
--    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
--  end
--end

--keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })


---- Highlight the symbol and its references on a CursorHold event(cursor is idle)
--vim.api.nvim_create_augroup("CocGroup", {})
--vim.api.nvim_create_autocmd("CursorHold", {
--  group = "CocGroup",
--  command = "silent call CocActionAsync('highlight')",
--  desc = "Highlight symbol under cursor on CursorHold"
--})


---- Symbol renaming
--keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })


---- Formatting selected code
--keyset("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
--keyset("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })


---- Setup formatexpr specified filetype(s)
--vim.api.nvim_create_autocmd("FileType", {
--  group = "CocGroup",
--  pattern = "typescript,json",
--  command = "setl formatexpr=CocAction('formatSelected')",
--  desc = "Setup formatexpr specified filetype(s)."
--})

---- Update signature help on jump placeholder
--vim.api.nvim_create_autocmd("User", {
--  group = "CocGroup",
--  pattern = "CocJumpPlaceholder",
--  command = "call CocActionAsync('showSignatureHelp')",
--  desc = "Update signature help on jump placeholder"
--})

---- Apply codeAction to the selected region
---- Example: `<leader>aap` for current paragraph
--local opts = { silent = true, nowait = true }
--keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
--keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

---- Remap keys for apply code actions at the cursor position.
--keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
---- Remap keys for apply code actions affect whole buffer.
--keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
---- Remap keys for applying codeActions to the current buffer
--keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)
---- Apply the most preferred quickfix action on the current line.
--keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

---- Remap keys for apply refactor code actions.
--keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
--keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
--keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

---- Run the Code Lens actions on the current line
--keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


---- Map function and class text objects
---- NOTE: Requires 'textDocument.documentSymbol' support from the language server
--keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
--keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
--keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
--keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
--keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
--keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
--keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
--keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


---- Remap <C-f> and <C-b> to scroll float windows/popups
-----@diagnostic disable-next-line: redefined-local
--local opts = { silent = true, nowait = true, expr = true }
--keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
--keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
--keyset("i", "<C-f>",
--  'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
--keyset("i", "<C-b>",
--  'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
--keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
--keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


---- Use CTRL-S for selections ranges
---- Requires 'textDocument/selectionRange' support of language server
--keyset("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
--keyset("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true })


---- Add `:Format` command to format current buffer
--vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

---- " Add `:Fold` command to fold current buffer
--vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })

---- Add `:OR` command for organize imports of the current buffer
--vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

---- Add (Neo)Vim's native statusline support
---- NOTE: Please see `:h coc-status` for integrations with external plugins that
---- provide custom statusline: lightline.vim, vim-airline
--vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

---- Mappings for CoCList
---- code actions and coc stuff
-----@diagnostic disable-next-line: redefined-local
--local opts = { silent = true, nowait = true }
---- Show all diagnostics
--keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
---- Manage extensions
--keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
---- Show commands
--keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
---- Find symbol of current document
--keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
---- Search workspace symbols
--keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
---- Do default action for next item
--keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
---- Do default action for previous item
--keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
---- Resume latest coc list
--keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)


----COC
--vim.api.nvim_set_keymap('i', '<C-Space>', '<cmd>CocRefresh()<CR>', { silent = true })
--vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
--vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })



--vim.g.coc_global_extensions = {
--  'coc-json', 'coc-git', 'coc-pairs',
--  'coc-css', 'coc-tsserver', 'coc-highlight', 'coc-marketplace',
--  'coc-snippets', 'coc-html', 'coc-format-json', 'coc-tslint',
--  'coc-jedi', 'coc-webpack', 'coc-prettier', 'coc-pyright',
--  'coc-svg', 'coc-diagnostic', 'coc-emmet', 'coc-terminal', 'coc-translator',
--  'coc-sourcekit', 'coc-tslint-plugin', 'coc-github',
--  'coc-htmldjango', 'coc-angular', 'coc-eslint',
--  'coc-simple-react-snippets', 'coc-html-css-support', 'coc-tsdetect',
--  'coc-sql', 'coc-vimlsp', 'coc-docker', 'coc-yaml', 'coc-blade',
--  'coc-db', 'coc-lua'
--}



--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

vim.keymap.set(
	{"n", "x"},
	"<leader>rr",
	function() require('telescope').extensions.refactoring.refactors() end
)


--Css
require("nvim-highlight-colors").setup {
  render = 'background', -- or 'foreground' or 'first_column'
  enable_named_colors = true,
  enable_tailwind = false,
  custom_colors = {
    -- label property will be used as a pattern initially(string.gmatch), therefore you need to escape the special characters by yourself with %
    { label = '%-%-theme%-font%-color',       color = '#fff' },
    { label = '%-%-theme%-background%-color', color = '#23222f' },
    { label = '%-%-theme%-primary%-color',    color = '#0f1219' },
    { label = '%-%-theme%-secondary%-color',  color = '#5a5d64' },
    { label = '%-%-theme%-contrast%-color',   color = '#fff' },
    { label = '%-%-theme%-accent%-color',     color = '#55678e' },
  }
}

---DB SQL SERVER

vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notifications = 1
vim.g.db_ui_win_position = "left"
vim.g.db_ui_winwidth = 80
vim.g.db_ui_icons = {
  expanded = {
    db = "▾ ",
    buffers = "▾ ",
    saved_queries = "▾ ",
    schemas = "▾ ",
    schema = "▾ פּ",
    tables = "▾ 藺",
    table = "▾ ",
  },
  collapsed = {
    db = "▸ ",
    buffers = "▸ ",
    saved_queries = "▸ ",
    schemas = "▸ ",
    schema = "▸ פּ",
    tables = "▸ 藺",
    table = "▸ ",
  },
  saved_query = "",
  new_query = "璘",
  tables = "離",
  buffers = "﬘",
  add_connection = "",
  connection_ok = "✓",
  connection_error = "✕",
}

vim.cmd([[
highlight! link NeoTreeDirectoryIcon NvimTreeFolderIcon
highlight! link NeoTreeDirectoryName NvimTreeFolderName
highlight! link NeoTreeSymbolicLinkTarget NvimTreeSymlink
highlight! link NeoTreeRootName NvimTreeRootFolder
highlight! link NeoTreeDirectoryName NvimTreeOpenedFolderName
highlight! link NeoTreeFileNameOpened NvimTreeOpenedFile
]])


-- Establecer el tipo de archivo para *.html como htmldjango
-- vim.cmd("autocmd BufNewFile,BufRead *.html set filetype=htmldjango")

local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end

autotag.setup({})

local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})



