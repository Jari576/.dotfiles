return {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
        local nightfox = require("nightfox")
        nightfox.setup({
            options = {
                -- dim_inactive = false, -- Non focused panes set to alternative background
                styles = {                   -- Style to be applied to different syntax groups
                    comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
                    conditionals = "NONE",
                    constants = "NONE",
                    functions = "NONE",
                    keywords = "NONE",
                    numbers = "NONE",
                    operators = "NONE",
                    strings = "NONE",
                    types = "NONE",
                    variables = "NONE",
                },
                groups = {
                    all = {
                        IlluminatedWordText = { link = "CursorLine" },
                        IlluminatedWordRead = { link = "CursorLine" },
                        IlluminatedWordWrite = { link = "CursorLine" },
                    }
                },
            },
        })
        vim.cmd("colorscheme nightfox")
    end,
}
