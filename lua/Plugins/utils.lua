return {
--Tmux
{ 'christoomey/vim-tmux-navigator' },
--Comentarios
{ 'tpope/vim-commentary' },
{ 'scrooloose/nerdcommenter' },
-- Surround
{ 'tpope/vim-surround' },
{
  "roobert/surround-ui.nvim",
  dependencies = {
    "kylechui/nvim-surround",
    "folke/which-key.nvim",
  },
  config = function()
    require("surround-ui").setup({
      root_key = "S"
    })
  end,
},
--Suda
{'lambdalisue/suda.vim' },
--Erros
{ 'dense-analysis/ale' },
{ 'eslint/eslint', ft={'javascript','typescript'} },
--Git
{ 'tpope/vim-fugitive' },
{'lewis6991/gitsigns.nvim'},
--
--DBUI
{ 'tpope/vim-dadbod', event = "VeryLazy"  },
{ 'kristijanhusak/vim-dadbod-ui', event = "VeryLazy" },
--Refactor 
{
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup()
  end,
},

--Debugger 
{'mfussenegger/nvim-dap'},
{'mfussenegger/nvim-dap-python',
},

{'mfussenegger/nvim-dap-ui',
  dependencies = "mfussenegger/nvim-dap",
},
--Windos Picker
{ 's1n7ax/nvim-window-picker' },
--FZF
{ 'ibhagwan/fzf-lua' },
--Auto Pairs
{
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {} -- this is equalent to setup({}) function
},
--Autotag
{'windwp/nvim-ts-autotag'},
--REST 
{
  "vhyrro/luarocks.nvim",
  priority = 1000,
  config = true,
  opts = {
      rocks = {"mimetypes","nvim-nio","xml2lua", "lua-curl"}
    }
},
{
  "rest-nvim/rest.nvim",
  dependencies = { "luarocks.nvim" },
  config = function()
    require("rest-nvim").setup({
  client = "curl",
  env_file = ".env",
  env_pattern = "\\.env$",
  env_edit_command = "tabedit",
  encode_url = true,
  skip_ssl_verification = false,
  custom_dynamic_variables = {
          -- ['jwt'] = function()
          --   return os.getenv('JWT_TOKEN')
          -- end
         },
  logs = {
    level = "info",
    save = true,
  },
  result = {
    split = {
      horizontal = false,
      in_place = false,
      stay_in_current_window_after_split = true,
    },
    behavior = {
      decode_url = true,
      show_info = {
        url = true,
        headers = true,
        http_info = true,
        curl_command = true,
      },
      statistics = {
        enable = true,
        ---@see https://curl.se/libcurl/c/curl_easy_getinfo.html
        stats = {
          { "total_time", title = "Time taken:" },
          { "size_download_t", title = "Download size:" },
        },
      },
      formatters = {
        json = "jq",
        html = function(body)
          if vim.fn.executable("tidy") == 0 then
            return body, { found = false, name = "tidy" }
          end
          local fmt_body = vim.fn.system({
            "tidy",
            "-i",
            "-q",
            "--tidy-mark",      "no",
            "--show-body-only", "auto",
            "--show-errors",    "0",
            "--show-warnings",  "0",
            "-",
          }, body):gsub("\n$", "")

          return fmt_body, { found = true, name = "tidy" }
        end,
      },
    },
    keybinds = {
      buffer_local = true,
      prev = "H",
      next = "L",
    },
  },
  highlight = {
    enable = true,
    timeout = 750,
  },
  ---@see vim.keymap.set
  keybinds = {
      {
        "<leader>Rsr", "<cmd>Rest run<cr>", "Run request under the cursor"
      },
      {
        "<leader>Rsl", "<cmd>Rest run last<cr>", "Re-run lastest request"
      }
    },



      })
  end,
},
----markDown

---- install without yarn or npm
{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
},


-- install with yarn or npm

}
