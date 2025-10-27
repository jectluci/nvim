-- on_attach único (keys + format on save + navic + code action robusto)
local navic_ok, navic = pcall(require, "nvim-navic")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", require("snacks").picker.lsp_definitions, "[G]oto [D]efinition")
        map("gr", require("snacks").picker.lsp_references, "[G]oto [R]eferences")
        map("gI", require("snacks").picker.lsp_implementations, "[G]oto [I]mplementation")
        -- map("<leader>D", require("snacks").picker.lsp_type_definitions, "Type [D]efinition")
        map("<leader>fS", require("snacks").picker.lsp_symbols, "[D]ocument [S]ymbols")
        map("<leader>ws", require("snacks").picker.lsp_workspace_symbols, "[W]orkspace [S]ymbols")
        map("<leader>vr", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("K", function()
            vim.lsp.buf.hover({ border = "rounded" })
        end, "Hover Documentation")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        -- will be done with conform
        -- map("<leader>f", vim.lsp.buf.format, "[F]ormat the document")

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                end,
            })
        end
    end,
})

vim.api.nvim_create_user_command("LspStop", function(args)
    local lsp_name = args.fargs[1]
    local filter = {}
    if lsp_name then
        filter.name = lsp_name
    end
    vim.lsp.stop_client(vim.lsp.get_clients(filter))
    vim.cmd("edit")
end, {
    nargs = "?",
    complete = function()
        return vim.iter(vim.lsp.get_clients())
            :map(function(client)
                return client.name
            end)
            :totable()
    end,
})

vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("angularls")
vim.lsp.enable("emmet_ls")
vim.lsp.enable("html")
vim.lsp.enable('jedi_language_server')
vim.lsp.enable("tailwindcss")
vim.lsp.enable("ruff")
vim.lsp.enable('pylsp')
-- vim.lsp.enable('pylyzer')
vim.lsp.enable('pyright')


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
vim.filetype.add({ pattern = { [".*%.component%.html"] = "angular.html" } })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "angular.html",
    callback = function() pcall(vim.treesitter.language.register, "html", "angular.html") end,
})
