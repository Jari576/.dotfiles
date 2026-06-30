return {
	"folke/which-key.nvim",
	dependencies = {
        "echasnovski/mini.icons"
    },
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
		icons = {
			breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
			separator = "➜", -- symbol used between a key and it's label
			group = "+", -- symbol prepended to a group
		},
		keys = {
			scroll_down = "<c-d>", -- binding to scroll down inside the popup
			scroll_up = "<c-u>", -- binding to scroll up inside the popup
		},
		layout = {
			height = { min = 4, max = 25 }, -- min and max height of the columns
			width = { min = 20, max = 50 }, -- min and max width of the columns
			spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		show_help = true, -- show a help message in the command line for using WhichKey
		show_keys = true, -- show the currently pressed key and its label as a message in the command line
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
			L = { "<CMD>Lazy<CR>", "Lazy" },
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
