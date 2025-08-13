-- Mason base
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls", "ts_ls", "html", "cssls", "tailwindcss",
        "pyright", -- o "pylsp" si lo prefieres
        "emmet_ls",
    }
})

-- Capabilities (CMP)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- on_attach único (keys + format on save + navic)
local navic_ok, navic = pcall(require, "nvim-navic")
local function on_attach(client, bufnr)
    local function bufmap(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
    end

    -- Navegación
    bufmap("n", "gd", vim.lsp.buf.definition, "Go to Definition")
    bufmap("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
    bufmap("n", "gr", vim.lsp.buf.references, "List References")
    bufmap("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
    bufmap("n", "K", vim.lsp.buf.hover, "Hover Info")
    bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
    bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
    bufmap("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
    bufmap("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
    bufmap("n", "<leader>e", vim.diagnostic.open_float, "Diag Float")

    -- Formateo al guardar (desactiva si te molesta)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function() vim.lsp.buf.format({ async = false }) end,
        })
    end

    -- Navic breadcrumbs si el server lo soporta
    if navic_ok and client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    -- Semantic tokens (seguro y sin redefinir on_attach mil veces)
    if client.server_capabilities.semanticTokensProvider then
        vim.lsp.semantic_tokens.start(bufnr, client.id)
        local aug = vim.api.nvim_create_augroup("LspSemanticTokens_" .. bufnr, { clear = true })
        vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
            group = aug,
            buffer = bufnr,
            callback = function() pcall(vim.lsp.semantic_tokens.force_refresh) end,
        })
    end
end

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

-- TypeScript (nuevo nombre en lspconfig: ts_ls)
lspconfig.ts_ls.setup({
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
    on_attach = on_attach,
    capabilities = capabilities,
})

-- TailwindCSS
lspconfig.tailwindcss.setup({
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = {
        "angular", "html", "css", "less", "postcss", "sass", "scss", "javascript", "javascriptreact",
        "typescript", "typescriptreact", "vue", "svelte", "markdown", "mdx", "php", "twig", "astro",
    },
    root_dir = util.root_pattern("tailwind.config.js", "tailwind.config.ts", "package.json"),
    settings = {
        tailwindCSS = {
            classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning",
            },
            validate = true,
        }
    },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- CSS Modules (si realmente lo usas)
lspconfig.cssmodules_ls.setup({
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "scss", "sass" },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Lua
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = { workspace = { checkThirdParty = false }, diagnostics = { globals = { "vim" } } }
    }
})

-- Python (elige uno: pyright o pylsp)
lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
            }
        }
    }
})
-- Si prefieres pylsp, comenta pyright y habilita:
-- lspconfig.pylsp.setup({
--   on_attach = on_attach, capabilities = capabilities,
--   settings = { pylsp = { plugins = { pycodestyle = { ignore = {'W391'}, maxLineLength = 100 } } } }
-- })

-- Angular (tu ruta local)
local project_library_path = "/home/ject/node_modules/@angular/language-server/bin"
local ng_cmd = { "ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations",
    project_library_path }
lspconfig.angularls.setup({
    cmd = ng_cmd,
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'angular.html' }, -- tu ft custom
    on_new_config = function(new_config, _)
        new_config.cmd = ng_cmd
    end,
})

-- lspkind
local lspkind = require('lspkind')

-- CMP (una sola vez, con LuaSnip)
local cmp = require('cmp')
local luasnip = require('luasnip')                 -- por si acaso
require('luasnip.loaders.from_vscode').lazy_load() -- si usas friendly-snippets

cmp.setup({
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = '…',
            menu = { buffer = "[Buf]", nvim_lsp = "[LSP]", path = "[Path]", luasnip = "[Snip]" },
            before = function(entry, vim_item)
                -- Colorea clases Tailwind si tienes tailwindcss-colorizer-cmp
                local ok_tw, tw = pcall(require, "tailwindcss-colorizer-cmp")
                if ok_tw then vim_item = tw.formatter(entry, vim_item) end
                return vim_item
            end,
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
    }),
    performance = {
        debounce = 60,
        throttle = 100,
        fetching_timeout = 200,
    },
})

-- CMP en cmdline
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } },
})
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
    matching = { disallow_symbol_nonprefix_matching = false }
})

-- (Opcional) CMP para gitcommit si instalas petertriho/cmp-git
-- local ok_git, cmp_git = pcall(require, "cmp_git")
-- if ok_git then
--   cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({ { name = 'cmp_git' } }, { { name = 'buffer' } })
--   })
-- end

-- (Opcional) autopairs integración
local ok_pairs, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if ok_pairs then
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

vim.cmd [[
  highlight! link @lsp.type.function Function
  highlight! link @lsp.type.variable Identifier
  highlight! link @lsp.type.parameter Identifier
  highlight! link @lsp.type.property Identifier
  highlight! link @lsp.type.keyword Keyword
  highlight! link @lsp.type.class Type
]]

-- Tweaks generales
vim.opt.updatetime = 200
