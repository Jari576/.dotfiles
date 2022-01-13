local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost init.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("packer not loaded", "error")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({
				border = "rounded",
			})
		end,
	},
	log = {
		level = "debug",
	},
})

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local get_config = function(name)
	return string.format('require("plugins/configs/%s")', name)
end

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- An implementation of the Popup API from vim in Neovim
	use({
		"nvim-lua/popup.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Autopairs, integrates with both cmp and treesitter
	use({
		"windwp/nvim-autopairs",
		config = get_config("autopairs"),
	})

	use({
		"rcarriga/nvim-notify",
		config = get_config("notify"),
	})

	-- file manager
	use({
		"kyazdani42/nvim-tree.lua",
		config = get_config("tree"),
	})

	-- Tab bar
	use({
		"akinsho/bufferline.nvim",
		config = get_config("bufferline"),
	})

	-- Close tabs
	use("moll/vim-bbye")

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = get_config("lualine"),
	})

	-- In-Editor terminals
	use({
		"akinsho/toggleterm.nvim",
		config = get_config("toggleterm"),
	})

	-- Project navigation
	use({
		"ahmedkhalf/project.nvim",
		config = get_config("project"),
	})

	-- Startup speed optimations
	use({
		"lewis6991/impatient.nvim",
		config = get_config("impatient"),
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = get_config("indent-blankline"),
	})

	use({
		"goolord/alpha-nvim",
		config = get_config("alpha"),
	})

	--   use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
	use({
		"folke/which-key.nvim",
		config = get_config("which-key"),
	})

	-- Colorschemes
	use("lunarvim/colorschemes") -- A bunch of colorschemes you can try out

	-- cmp plugins
	-- The completion plugin
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"kdheepak/cmp-latex-symbols",
		},
		config = get_config("cmp"),
	})

	-- a bunch of snippets to use
	use("rafamadriz/friendly-snippets")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = get_config("LSP"),
	})
	use({
		"williamboman/nvim-lsp-installer",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp", opt = true },
		},
		config = get_config("lsp-installer"),
	})
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for

	-- for formatters and linters
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = get_config("null-ls"),
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { {"nvim-telescope/telescope-fzf-native.nvim", run = 'make'}, { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = get_config("telescope"),
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = get_config("treesitter"),
	})

	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = get_config("treesitter"),
	})

	-- Easily comment stuff
	use({
		"numToStr/Comment.nvim",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = get_config("comment"),
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = get_config("gitsigns"),
	})

	-- Smooth scrolling
	use({
		"psliwka/vim-smoothie",
	})

	use({
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
	})

	use({
        "stevearc/dressing.nvim",
        config = get_config("dressing")
    })

    use({
        "sunjon/Shade.nvim",
        config = get_config("shade")
    })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
