local lualine = require("lualine")

local config = {
    icons_enable = true,
    theme = "auto",
    sections = {
        lualine_y = y_section,
        lualine_a = {
            {
                "mode",
                fmt = function(str)
                    return dmode_enabled and "DEBUG" or str
                end,
                --   color = function(tb)
                --     return dmode_enabled and "dCursor" or tb
                --   end,
            },
        },
        lualine_b = {
            "branch",
            "diff",
            "diagnostics",
        },
        lualine_c = {
            "filename",
            {
                function()
                    local filetype = vim.bo.filetype

                    if filetype ~= "lua" then
                        return ""
                    end

                    local node = vim.treesitter.get_node()
                    if not node then
                        return ""
                    end
                    while node:type() ~= "function_declaration" do
                        node = node:parent()
                        if not node then
                            return ""
                        end
                    end

                    local function_name_node = node:named_child(0)
                    if not function_name_node then
                        return ""
                    end

                    return vim.treesitter.get_node_text(function_name_node, 0)
                end,
                icon = { "󰊕", color = { fg = "#40E0D0" } },
            },
        },
    }
}
