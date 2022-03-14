local status_ok, dressing = pcall(require, "dressing")
if not status_ok then
	vim.notify("dressing not loaded", "error")
	return
end

dressing.setup({
	input = {
		enabled = true,

		-- Default prompt string
		default_prompt = "➤ ",

		-- When true, <Esc> will close the modal
		insert_only = true,

		-- These are passed to nvim_open_win
		anchor = "SW",
		border = "rounded",
		relative = "cursor",

		-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		prefer_width = 40,
		width = nil,
		max_width = { 140, 0.9 },
		min_width = { 20, 0.2 },

		-- Window transparency (0-100)
		winblend = 10,
		-- Change default highlight groups (see :help winhl)
		winhighlight = "",

		override = function(conf)
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			return conf
		end,

		-- see :help dressing_get_config
		get_config = nil,
	},
	select = {
		enabled = true,

		-- Priority list of preferred vim.select implementations
		backend = { "telescope", "fzf", "builtin", "nui" },

		-- Options for telescope selector
		telescope = {
			-- can be 'dropdown', 'cursor', or 'ivy'
			theme = "dropdown",
		},

		-- Options for fzf selector
		fzf = {
			window = {
				width = 0.5,
				height = 0.4,
			},
		},

		-- Options for nui Menu
		nui = {
			position = "50%",
			size = nil,
			relative = "editor",
			border = {
				style = "rounded",
			},
			max_width = 80,
			max_height = 40,
		},

		-- Options for built-in selector
		builtin = {
			-- These are passed to nvim_open_win
			anchor = "NW",
			border = "rounded",
			relative = "cursor",

			-- Window transparency (0-100)
			winblend = 10,
			-- Change default highlight groups (see :help winhl)
			winhighlight = "",

			-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			width = nil,
			max_width = { 140, 0.8 },
			min_width = { 40, 0.2 },
			height = nil,
			max_height = 0.9,
			min_height = { 10, 0.2 },
			override = function(conf)
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				return conf
			end,
		},

		-- Used to override format_item. See :help dressing-format
		format_item_override = {},

		-- see :help dressing_get_config
		get_config = nil,
	},
})
