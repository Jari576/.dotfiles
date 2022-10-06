local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    vim.notify("tree not loaded", vim.log.levels.ERROR)
    return
end

nvim_tree.setup({
    disable_netrw = false,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_buffer_on_setup = true,
    auto_reload_on_write = true,
    open_on_tab = true,
    hijack_cursor = true,
    update_cwd = false,
    hijack_unnamed_buffer_when_opening = true,
    filesystem_watchers = {
        enable = true,
    },
    renderer = {
        highlight_opened_files = "all",
        full_name = true,
        highlight_git = true,
        group_empty = true,
        indent_markers = {
            enable = false,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                none = " ",
            },
        },
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
            }
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 100,
    },
    view = {
        width = 30,
        adaptive_size = true,
        hide_root_folder = false,
        side = "left",
        number = true,
        relativenumber = true,
        signcolumn = "yes",
        mappings = {
            custom_only = true,
            list = {
                { key = { "<CR>", "o", "<2-LeftMouse>", "l" }, action = "edit" },
                { key = { "O" }, action = "edit_no_picker" },
                { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
                { key = { "v" }, action = "vsplit" },
                { key = { "x" }, action = "split" },
                { key = { "<C-t>" }, action = "tabnew" },
                { key = { "<" }, action = "prev_sibling" },
                { key = { ">" }, action = "next_sibling" },
                { key = { "P" }, action = "parent_node" },
                { key = { "<BS>", "h" }, action = "close_node" },
                { key = { "<Tab>" }, action = "preview" },
                { key = { "K" }, action = "first_sibling" },
                { key = { "J" }, action = "last_sibling" },
                { key = { "R" }, action = "refresh" },
                { key = { "a" }, action = "create" },
                { key = { "d" }, action = "remove" },
                { key = { "D" }, action = "trash" },
                { key = { "r" }, action = "rename" },
                { key = { "<C-r>" }, action = "full_rename" },
                { key = { "<C-x>" }, action = "cut" },
                { key = { "<C-c>" }, action = "copy" },
                { key = { "p" }, action = "paste" },
                { key = { "y" }, action = "copy_name" },
                { key = { "Y" }, action = "copy_path" },
                { key = { "gy" }, action = "copy_absolute_path" },
                { key = { "[c" }, action = "prev_git_item" },
                { key = { "]c" }, action = "next_git_item" },
                { key = { "-" }, action = "dir_up" },
                { key = { "s" }, action = "system_open" },
                { key = { "q" }, action = "close" },
                { key = { "g?" }, action = "toggle_help" },
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    actions = {
        change_dir = {
            enable = false,
            global = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                exclude = {
                    buftype = {
                        "notify",
                        "terminal",
                        "help",
                        "nofile"
                    },
                },
            },
        },
    },
})
