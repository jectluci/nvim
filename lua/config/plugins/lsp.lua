-- Mason base
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "angularls",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "emmet_ls",
        "lua_ls",
        "pyright",
    },
})

-- Capabilities (CMP)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- on_attach único (keys + format on save + navic + code action robusto)
local navic_ok, navic = pcall(require, "nvim-navic")

local function on_attach(client, bufnr)
    local function bufmap(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
    end

    -- Navegación / helpers
    bufmap("n", "gd", vim.lsp.buf.definition, "Go to Definition")
    bufmap("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
    bufmap("n", "gr", vim.lsp.buf.references, "List References")
    bufmap("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
    bufmap("n", "K", vim.lsp.buf.hover, "Hover Info")
    bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
    bufmap("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
    bufmap("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
    bufmap("n", "<leader>e", vim.diagnostic.open_float, "Diag Float")

    -- Code actions (cursor)
    bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

    -- Code actions (RANGO) → funciona en v / V / Ctrl-V y no crashea en MAXCOL
    bufmap("x", "<leader>ca", function()
        if vim.lsp.buf.range_code_action then
            vim.lsp.buf.range_code_action()
            return
        end
        local srow, scol = unpack(vim.api.nvim_buf_get_mark(0, "<"))
        local erow, ecol = unpack(vim.api.nvim_buf_get_mark(0, ">"))
        if srow > erow or (srow == erow and scol > ecol) then
            srow, erow = erow, srow
            scol, ecol = ecol, scol
        end
        srow, erow = srow - 1, erow - 1
        local MAXCOL = 2147483647
        if ecol == MAXCOL or ecol == -1 then
            local line = vim.api.nvim_buf_get_lines(bufnr, erow, erow + 1, false)[1] or ""
            ecol = #line
        end
        vim.lsp.buf.code_action({
            range = {
                start = { line = srow, character = scol },
                ["end"] = { line = erow, character = ecol },
            },
        })
    end, "Code Action (range)")

    -- Formateo al guardar (apágalo si usas conform.nvim)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end

    -- Navic breadcrumbs
    if navic_ok and client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end

    -- Semantic tokens
    if client.server_capabilities.semanticTokensProvider then
        vim.lsp.semantic_tokens.start(bufnr, client.id)
        local aug = vim.api.nvim_create_augroup("LspSemanticTokens_" .. bufnr, { clear = true })
        vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
            group = aug,
            buffer = bufnr,
            callback = function()
                pcall(vim.lsp.semantic_tokens.force_refresh)
            end,
        })
    end

    -- Resaltado de referencias bajo el cursor (si el server lo soporta)
    if client.server_capabilities.documentHighlightProvider then
        local grp = vim.api.nvim_create_augroup("LspDocHighlight_" .. bufnr, { clear = true })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = grp,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            group = grp,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

-- lspconfig
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

-- Angular Language Server (vía Mason; sin cmd custom)
lspconfig.angularls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "angular.html" },
    root_dir = util.root_pattern("angular.json", "nx.json", "project.json", "package.json", ".git"),
})

-- HTML / CSS
lspconfig.html.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.cssls.setup({ on_attach = on_attach, capabilities = capabilities })

-- TailwindCSS (con angular.html y ngClass)
lspconfig.tailwindcss.setup({
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = {
        "html",
        "angular.html",
        "css",
        "less",
        "postcss",
        "sass",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "markdown",
        "mdx",
        "php",
        "twig",
        "astro",
    },
    root_dir = util.root_pattern("tailwind.config.js", "tailwind.config.ts", "package.json"),
    settings = {
        tailwindCSS = {
            classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
            validate = true,
            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidConfigPath = "error",
                invalidScreen = "error",
                invalidTailwindDirective = "error",
                invalidVariant = "error",
                recommendedVariantOrder = "warning",
            },
        },
    },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Emmet (incluye angular.html)
lspconfig.emmet_ls.setup({
    filetypes = { "html", "css", "scss", "typescriptreact", "javascriptreact", "angular.html" },
    on_attach = on_attach,
    capabilities = capabilities,
})

-- Lua
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            diagnostics = { globals = { "vim" } },
        },
    },
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
            },
        },
    },
})
-- lspconfig.pylsp.setup({ on_attach = on_attach, capabilities = capabilities })

-- nvim-cmp + LuaSnip + lspkind
local lspkind = require("lspkind")
local cmp = require("cmp")
local luasnip_ok, _ = pcall(require, "luasnip")
if luasnip_ok then
    require("luasnip.loaders.from_vscode").lazy_load() -- si tienes friendly-snippets
end

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "…",
            -- menu = { buffer = "[Buf]", nvim_lsp = "[LSP]", path = "[Path]", luasnip = "[Snip]" },
            before = function(entry, vim_item)
                local source = entry.source.name
                local client_name
                if source == "nvim_lsp" then
                    client_name = entry.source.source and entry.source.source.client and entry.source.source.client.name
                    if not client_name and entry.source.get_debug_name then
                        local dbg = entry.source:get_debug_name() -- ej: "nvim_lsp:tsserver"
                        client_name = dbg and dbg:match("nvim_lsp:(.+)$")
                    end
                end

                if client_name then
                    vim_item.menu = string.format("[%s]", client_name)
                else
                    local pretty = {
                        buffer = "[BUF]",
                        path = "[PATH]",
                        luasnip = "[SNIP]",
                        emoji = "[EMOJI]",
                        cmdline = "[CMD]",
                        git = "[GIT]",
                    }
                    vim_item.menu = pretty[source] or string.format("[%s]", source)
                end

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
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
    }),
    performance = {
        debounce = 60,
        throttle = 100,
        fetching_timeout = 200,
    },
})

-- CMP en cmdline (/, ? y :)
cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = "buffer" } },
})
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    matching = { disallow_symbol_nonprefix_matching = false },
})

-- autopairs integración (si tienes nvim-autopairs)
local ok_pairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if ok_pairs then
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

-- Highlight links para tipos LSP (visual bonito)
vim.cmd([[
  highlight! link @lsp.type.function Function
  highlight! link @lsp.type.variable Identifier
  highlight! link @lsp.type.parameter Identifier
  highlight! link @lsp.type.property Identifier
  highlight! link @lsp.type.keyword Keyword
  highlight! link @lsp.type.class Type
]])

-- Refactoring (opcional) con Telescope, protegido
pcall(function()
    require("telescope").load_extension("refactoring")
end)
vim.keymap.set({ "n", "x" }, "<leader>rr", function()
    local ok = pcall(vim.treesitter.get_parser, 0)
    if not ok then
        vim.notify("Instala el parser Treesitter para este archivo antes de refactorizar", vim.log.levels.WARN)
        return
    end
    require("telescope").extensions.refactoring.refactors()
end, { desc = "Refactoring (Telescope)" })

-- Ajuste general
vim.opt.updatetime = 200

-- Si usas Angular templates como angular.html, asegúrate en tu config general:
-- vim.filetype.add({ pattern = { [".*%.component%.html"] = "angular.html" } })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "angular.html",
--   callback = function() pcall(vim.treesitter.language.register, "html", "angular.html") end,
-- })
