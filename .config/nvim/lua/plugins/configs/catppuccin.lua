local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
    vim.notify("catppuccin theme not loaded", vim.log.levels.ERROR)
    return
end

require("catppuccin.lib.highlighter").syntax({
    Normal = { style = { "italic", "bold" } }
})

catppuccin.setup({
    transparent_background = false,
    term_colors = true,
    integrations = {
        aerial = false,
        barbar = false,
        beacon = false,
        bufferline = true,
        cmp = true,
        coc_nvim = false,
        dashboard = false,
        fern = false,
        fidget = false,
        gitgutter = false,
        gitsigns = true,
        hop = false,
        leap = false,
        lightspeed = false,
        lsp_saga = false,
        lsp_trouble = false,
        markdown = true,
        mini = false,
        neogit = false,
        notify = true,
        nvimtree = true,
        overseer = false,
        pounce = true,
        symbols_outline = false,
        telekasten = false,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        ts_rainbow = false,
        vim_sneak = false,
        vimwiki = false,
        which_key = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            },
        },
        neotree = {
            enabled = false,
            show_root = true,
            transparent_panel = false,
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
    },
})
