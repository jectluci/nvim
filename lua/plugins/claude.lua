return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
        { "<leader>A",  nil,                             desc = "Claude" },
        { "<leader>Ac", "<cmd>ClaudeCode<cr>",           desc = "Toggle Claude" },
        { "<leader>Af", "<cmd>ClaudeCodeFocus<cr>",      desc = "Focus Claude" },
        { "<leader>Ar", "<cmd>ClaudeCode --resume<cr>",  desc = "Resume Claude" },
        { "<leader>As", "<cmd>ClaudeCodeSend<cr>",       mode = "v",                    desc = "Send selección" },
        { "<leader>Ab", "<cmd>ClaudeCodeAdd %<cr>",      desc = "Agregar buffer actual" },
        { "<leader>Aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Aceptar diff" },
        { "<leader>Ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Rechazar diff" },
        {
            "<leader>As",
            "<cmd>ClaudeCodeTreeAdd<cr>",
            desc = "Agregar archivo",
            ft = { "oil" },
        },
    },
}
