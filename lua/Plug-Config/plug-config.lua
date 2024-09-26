--THemes
-- Lua
require("bluloco").setup({
  style = "dark" ,              -- "auto" | "dark" | "light"
  transparent = false,
  italics = false,
})

vim.cmd('colorscheme bluloco')

--NeoTree
-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
  {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
  {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
  {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
  {text = "", texthl = "DiagnosticSignHint"})
-- NOTE: this is changed from v1.x, which used the old style of highlight groups
-- in the form "LspDiagnosticsSignWarning"
require("neo-tree").setup({
       close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
       popup_border_style = "rounded",
       enable_git_status = true,
       enable_diagnostics = true,
       sort_case_insensitive = false, -- used when sorting files and directories in the tree
       sort_function = nil , -- use a custom function for sorting files and directories in the tree
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
           indent_size = 2,
           padding = 2, -- extra padding on left hand side
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
           trailing_slash = false,
           use_git_status_colors = true,
           highlight = "NeoTreeFileName",
         },
         git_status = {
           symbols = {
             -- Change type
             added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
             modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
             deleted   = "✖",-- this can only be used in the git_status source
             renamed   = "",-- this can only be used in the git_status source
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
         position = "right",
         width = 45,
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
         follow_current_file = false, -- This will find and focus the file in the active buffer every
                                      -- time the current file is changed while the tree is open.
         group_empty_dirs = false, -- when true, empty folders will be grouped together
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
         group_empty_dirs = true, -- when true, empty folders will be grouped together
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

vim.keymap.set('n', "<F2>",':Neotree show<cr>')
vim.keymap.set('n', "<F3>",':Neotree toggle<cr>')



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
    selection_display = function (char) return char end,
})

 require'window-picker'.setup({
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

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = {left = "", right = ""},
        section_separators = {left = "", right = ""},
        disabled_filetypes = {
            statusline = {},
            winbar = {}
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000
        }
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {"filename"},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {"g:coc_status", "bo:filetype"},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {
        lualine_a = {
            -- {
            --     "windows",
            --     -- show_filename_only = true, -- Shows shortened relative path when set to false.
            --     -- show_modified_status = true, -- Shows indicator when the window is modified.
            --     -- mode = 0, -- 0: Shows window name
            --     -- 1: Shows window index
            --     -- 2: Shows window name + window index

            --     max_length = vim.o.columns * 2 / 3, -- Maximum width of windows component,
            --     -- it can also be a function that returns
            --     -- the value of `max_length` dynamically.
            --     -- filetype_names = {
            --     --     TelescopePrompt = "Telescope",
            --     --     dashboard = "Dashboard",
            --     --     packer = "Packer",
            --     --     fzf = "FZF",
            --     --     alpha = "Alpha"
            --     -- }, -- Shows specific window name for that filetype ( { `filetype` = `window_name`, ... } )
            --     disabled_buftypes = {"quickfix", "prompt"}, -- Hide a window if its buffer's type is disabled
            --     windows_color = {
            --         -- Same values as the general color option can be used here.
            --         active = "lualine_{section}_normal", -- Color for active window.
            --         inactive = "lualine_{section}_inactive" -- Color for inactive window.
            --     }
            -- }
        },
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {}
}

--Tabbar
vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        mode = "tabs",
        numbers = "ordinal",
        diagnostics = "nvim_lsp"
    }
}

---Icons
require("nvim-web-devicons").set_default_icon("", "#6d8086")
require "nvim-web-devicons".setup {
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            name = "Zsh"
        },
        angular = {
            icon = "",
            color = "#E23237"
        },
        git = {
            icon = "",
            color = "#F14C28",
            cterm_color = "202",
            name = "GitLogo"
        }
    },
    defaults = true
}

require("nvim-web-devicons").set_icon {
    htm = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Htm"
    },
    html = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Html"
    }
}

require "nvim-web-devicons".has_loaded()

--Icons Nerdtree

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


require'nvim-material-icon'.setup {
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
  };
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true;
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}
require'nvim-material-icon'.has_loaded()

require("nvim-material-icon").get_icon_by_filetype(filetype, opts)
require("nvim-material-icon").get_icon_colors_by_filetype(filetype, opts)
require("nvim-material-icon").get_icon_color_by_filetype(filetype, opts)
require("nvim-material-icon").get_icon_cterm_color_by_filetype(filetype, opts)


require'nvim-material-icon'.get_icons()
--LspConfig color
-- Lua
require("lsp-colors").setup(
    {
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981"
    }
)

require "nvim-treesitter.configs".setup {
    highlight = {
        enable = true,
        disable = {"css", "html"}
    },
    rainbow = {
        enable = true,
        disable = {"html"},
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
}


function _G.symbol_line()
  local curwin = vim.g.statusline_winid or 0
  local curbuf = vim.api.nvim_win_get_buf(curwin)
  local ok, line = pcall(vim.api.nvim_buf_get_var, curbuf, 'coc_symbol_line')
  return ok and line or ''
end

-- vim.o.tabline = '%!v:lua.symbol_line()'
vim.o.statusline = '%!v:lua.symbol_line()'
vim.o.winbar = '%!v:lua.symbol_line()'


vim.opt.list = true
vim.opt.listchars:append("eol:↴")




require("indent_blankline").setup {
    show_end_of_line = true
}



local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }

---DBUI
vim.g.db_ui_use_nerd_fonts = 1

--hierarchy-tree-go
require("hierarchy-tree-go").setup(
    {
        icon = {
            fold = "", -- fold icon
            unfold = "", -- unfold icon
            func = "₣", -- symbol
            last = "☉" -- last level icon
        },
        hl = {
            current_module = "guifg=Green", -- highlight cwd module line
            others_module = "guifg=Black", -- highlight others module line
            cursorline = "guibg=Gray guifg=White" -- hl  window cursorline
        },
        keymap = {
            --global keymap
            incoming = "<space>fi", -- call incoming under cursorword
            outgoing = "<space>fo", -- call outgoing under cursorword
            open = "<space>ho", -- open hierarchy win
            close = "<space>hc", -- close hierarchy win
            -- focus: if hierarchy win is valid but is not current win, set to current win
            -- focus: if hierarchy win is valid and is current win, close
            -- focus  if hierarchy win not existing,open and focus
            focus = "<space>fu",
            -- bufkeymap
            expand = "o", -- expand or collapse hierarchy
            jump = "<CR>", -- jump
            move = "<space><space>" -- switch the hierarchy window position, must be current win
        }
    }
)

---Tidy
require("tidy").setup(
    {
        filetype_exclude = {"markdown", "diff"}
        -- filetype_exclude = { "html","diff" },
    }
)
--Discord
-- The setup config table shows all available config options with their default values:
require("presence"):setup(
    {
        -- General options
        auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
        neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
        main_image = "neovim", -- Main image display (either "neovim" or "file")
        client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
        log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
        debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
        enable_line_number = false, -- Displays the current line number instead of the current project
        blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        -- Rich Presence text options
        editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = "Line %s out of %s" -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
    }
)
