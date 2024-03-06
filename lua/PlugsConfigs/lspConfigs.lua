---- -- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}
lspconfig.tsserver.setup{}
lspconfig.jedi_language_server.setup{
  filetypes = { "python" }
}
lspconfig.pylsp.setup{}
---- lspconfig.rust_analyzer.setup {
----   -- Server-specific settings. See `:help lspconfig-setup`
----   settings = {
----     ['rust-analyzer'] = {},
----   },
---- }


 -- Global mappings.
 -- See `:help vim.diagnostic.*` for documentation on any of the below functions
 vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
 vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
 vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
 vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

 -- Use LspAttach autocommand to only map the following keys
 -- after the language server attaches to the current buffer
 vim.api.nvim_create_autocmd('LspAttach', {
   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
   callback = function(ev)
     -- Enable completion triggered by <c-x><c-o>
     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

     -- Buffer local mappings.
     -- See `:help vim.lsp.*` for documentation on any of the below functions
     local opts = { buffer = ev.buf }
     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
     vim.keymap.set('n', '<space>wl', function()
       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
     end, opts)
     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
     vim.keymap.set('n', '<space>f', function()
       vim.lsp.buf.format { async = true }
     end, opts)
   end,
 })


---- require('lspconfig')['tsserver'].setup {
----   on_attach = on_attach,
----   flags = lsp_flags,
---- }
 local project_library_path = "/usr/local/lib/node_modules/@angular/language-server"
 local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}

 require'lspconfig'.angularls.setup{
   cmd = cmd,
   on_new_config = function(new_config,new_root_dir)
     new_config.cmd = cmd
   end,
 }

lspconfig.eslint.setup({
  --- ...
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

require 'lspconfig'.tailwindcss.setup {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge",
    "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex",
    "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css",
    "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript",
    "typescript", "typescriptreact", "vue", "svelte" },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "classList", "ngClass" },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning"
      },
      validate = true
    }
  }
}


require('lspkind').init({
  -- DEPRECATED (use mode instead): enables text annotations
  --
  -- default: true
  -- with_text = true,

  -- defines how annotations are shown
  -- default: symbol
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = 'symbol_text',

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = 'codicons',

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
  },
})


local lspkind = require('lspkind')
--CMP
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)     -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      require('snippy').expand_snippet(args.body) -- For `snippy` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
   formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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
    { name = 'vsnip' },     -- For vsnip users.
    { name = 'luasnip' },   -- For luasnip users.
    { name = 'ultisnips' }, -- For ultisnips users.
    { name = 'buffer' },
    { name = 'treesitter' },
    { name = 'snippy' }, -- For snippy users.
  }, {
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

--Mason
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})


--TaildWindCss Colors
require("cmp").config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}


