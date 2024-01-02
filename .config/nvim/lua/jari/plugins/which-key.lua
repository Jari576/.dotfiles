return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 100
	end,
	opts = {
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			presets = {
				operators = true, -- adds help for operators like d, y, ...
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		operators = { gc = "Comments" },
		key_labels = {
			-- override the label used to display some keys. It doesn't effect WK in any other way.
			-- For example:
			-- ["<space>"] = "SPC",
			-- ["<cr>"] = "RET",
			-- ["<tab>"] = "TAB",
		},
		motions = {
			count = true,
		},
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		popup_mappings = {
			scroll_down = "<c-d>", -- binding to scroll down inside the popup
			scroll_up = "<c-u>", -- binding to scroll up inside the popup
		},
		window = {
			border = "none", -- none, single, double, shadow
			position = "bottom", -- bottom, top
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
			padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
			winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
			zindex = 1000, -- positive value to position WhichKey above other floating windows.
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
		show_help = true, -- show a help message in the command line for using WhichKey
		show_keys = true, -- show the currently pressed key and its label as a message in the command line
		triggers = "auto", -- automatically setup triggers
		-- triggers = {"<leader>"} -- or specifiy a list manually
		-- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
		triggers_nowait = {
			-- marks
			"`",
			"'",
			"g`",
			"g'",
			-- registers
			'"',
			"<c-r>",
			-- spelling
			"z=",
		},
		triggers_blacklist = {
			-- list of mode / prefixes that should never be hooked by WhichKey
			-- this is mostly relevant for keymaps that start with a native binding
			i = { "j", "k" },
			v = { "j", "k" },
		},
		-- disable the WhichKey popup for certain buf types and file types.
		-- Disabled by default for Telescope
		disable = {
			buftypes = {},
			filetypes = {},
		},
		mapping_opts = {
			mode = "n",
			prefix = "<leader>",
			buffer = nil,
			silent = true,
			noremap = true,
			nowait = true,
		},
		mappings = {
			b = {
				name = "Buffers",
				b = {
					"<cmd>lua require'telescope.builtin'.buffers({ sort_mru = true, ignore_current_buffer = false })<cr>",
					"Find buffer",
				},
				p = { "<cmd>BufferLineMovePrev<cr>", "Move buffer prev" },
				n = { "<cmd>BufferLineMoveNext<cr>", "Move buffer next" },
			},
			e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
			w = { "<cmd>w!<CR>", "Save" },
			q = { "<cmd>q!<CR>", "Quit" },
			Q = { "<cmd>qa!<CR>", "Quit" },
			h = { "<cmd>nohlsearch<CR>", "No Highlight" },
			P = { "<cmd>Telescope projects<cr>", "Projects" },
			g = {
				name = "Git",
				g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
				l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
				o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
				b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
				c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
				d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
				r = { "<cmd>Gitsigns reset_buffer<cr>", "Reset buffer" },
				h = { "<cmd>Gitsigns toggle_linehl<cr><cmd> Gitsigns toggle_deleted<cr>", "See changes" },
			},
			L = { "<CMD>Lazy<CR>", "Close Buffer" },
			l = {
				name = "LSP",
				a = {
					"<cmd>lua vim.lsp.buf.code_action()<cr>",
					"Code Action",
				},
				d = {
					"<cmd>Telescope diagnostics bufnr=0<cr>",
					"Document Diagnostics",
				},
				D = {
					"<cmd>Telescope diagnostics<cr>",
					"Workspace Diagnostics",
				},
				f = { "<cmd>lua vim.lsp.buf.format({ async = true})<cr>", "Format" },
				i = { "<cmd>LspInfo<cr>", "Info" },
				I = { "<cmd>Mason<cr>", "Installer Info" },
				j = {
					"<cmd>lua vim.diagnostic.goto_next()<CR>",
					"Next Diagnostic",
				},
				k = {
					"<cmd>lua vim.diagnostic.goto_prev()<cr>",
					"Prev Diagnostic",
				},
				l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
				q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
				r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
				s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
				S = {
					"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
					"Workspace Symbols",
				},
			},
			s = {
				name = "Search",
				b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
				s = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in file" },
				S = { "<cmd>Telescope builtin<cr>", "choose any item to Search" },
				h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
				R = { "<cmd>Telescope registers<cr>", "Registers" },
				e = { "<cmd>Telescope env<cr>", "Environment variables" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				C = { "<cmd>Telescope commands<cr>", "Commands" },
			},
			t = {
				name = "Terminal",
				f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
				h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
				v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
			},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.register(opts.mappings, opts.mapping_opts)
	end,
}
