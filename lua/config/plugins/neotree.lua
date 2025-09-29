-- NeoTree
-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "󱧡",
            [vim.diagnostic.severity.HINT]  = "󰻸",
        },
    },
})
