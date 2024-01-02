return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count
        local hide_in_width = function()
            return vim.fn.winwidth(0) > 80
        end

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = {
                error = " ",
                warn = " ",
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
        }

        local diff = {
            "diff",
            colored = true,
            symbols = {
                added = " ",
                modified = " ",
                removed = " ",
            }, -- changes diff symbols
            cond = hide_in_width,
        }

        local mode = {
            "mode",
            icons_enabled = true,
        }

        local filetype = {
            "filetype",
            icons_enabled = true,
        }

        local branch = {
            "branch",
            icons_enabled = true,
            icon = "",
        }

        local spaces = function()
            return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end

        local lazy_status = {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
        }

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = {
                    left = "",
                    right = "",
                },
                section_separators = {
                    left = "",
                    right = "",
                },
                disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { branch },
                lualine_b = { mode },
                lualine_c = { "filename", diagnostics },
                lualine_x = { diff, spaces, "encoding", filetype },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = {},
        })
    end,
}
