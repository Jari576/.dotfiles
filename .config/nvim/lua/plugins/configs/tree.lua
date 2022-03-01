local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify("tree not loaded", "error")
	return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	disable_netrw = false,
	hijack_netrw = true,
	open_on_setup = true,
	ignore_ft_on_setup = { "startify", "dashboard", "alpha" },
	auto_close = false,
	auto_reload_on_write = true,
	open_on_tab = true,
	hijack_cursor = true,
	update_cwd = true,
	hijack_unnamed_buffer_when_opening = true,
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
		update_cwd = true,
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
		ignore = true,
		timeout = 100,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = false,
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
				{ key = { "<BS>" }, action = "close_node" },
				{ key = { "<Tab>" }, action = "preview" },
				{ key = { "K" }, action = "first_sibling" },
				{ key = { "J" }, action = "last_sibling" },
				{ key = { "I" }, action = "toggle_ignored" },
				{ key = { "H" }, action = "toggle_dotfiles" },
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
				-- { key = { "q" }, action = "close" },
				{ key = { "g?" }, action = "toggle_help" },
			},
		},
		number = true,
		relativenumber = true,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	actions = {
		change_dir = {
			global = false,
		},
		open_file = {
			quit_on_open = false,
		},
	},
})
