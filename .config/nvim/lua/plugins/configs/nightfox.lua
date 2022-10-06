local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
    vim.notify("nightfox not loaded", vim.log.levels.ERROR)
    return
end

nightfox.setup({
    options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = false, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        styles = { -- Style to be applied to different syntax groups
            comments = "italic", -- Value is any valid attr-list value `:help attr-list`
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
        inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
        },
        modules = { -- List of various plugins and additional options
            cmp = true,
            diagnostic = {
                enable = true,
                background = true,
            },
            fidget = true,
            gitsigns = true,
            illuminate = true,
            mini = false,
            modes = true,
            native_lsp = {
                enable = true,
                background = true,
            },
            notify = true,
            nvimtree = true,
            pounce = true,
            telescope = true,
            treesitter = true,
            whichkey = true,
        },
    },
    palettes = {},
    specs = {},
    groups = {
        all = {
            IlluminatedWordText = { link = "CursorLine" },
            IlluminatedWordRead = { link = "CursorLine" },
            IlluminatedWordWrite = { link = "CursorLine" },
        }
    },
})

vim.cmd("colorscheme nightfox")
