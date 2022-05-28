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
    vim.cmd([[packadd! packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save this file
-- vim.cmd([[
--     augroup packer_user_config
--         autocmd!
--         autocmd BufWritePost init.lua source <afile> | PackerSync
--     augroup end
-- ]])

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
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
        },
        config = get_config("tree"),
    })

    -- visualize cursor jumps
    use({
        "edluffy/specs.nvim",
        config = get_config("specs"),
    })

    use({
        "Pocco81/AutoSave.nvim",
        config = get_config("autosave"),
    })

    -- Tab bar
    use({
        "akinsho/bufferline.nvim",
        branch = "main",
        requires = "kyazdani42/nvim-web-devicons",
        config = get_config("bufferline"),
    })

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
        branch = "main",
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
        "luukvbaal/stabilize.nvim",
        config = get_config("stabilize"),
    })

    use({
        "folke/which-key.nvim",
        config = get_config("which-key"),
    })

    use("moll/vim-bbye")

    -- Colorscheme
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = get_config("catppuccin")
    })

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

    use("rafamadriz/friendly-snippets")
    use({
        "avneesh0612/react-nextjs-snippets",
        branch = "main"
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = get_config("lspconfig"),
    })
    use({
        "williamboman/nvim-lsp-installer",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "b0o/schemastore.nvim" },
        },
        config = get_config("lsp-installer"),
    })
    use({
        "ray-x/lsp_signature.nvim",
        config = get_config("lsp_signature"),
    })
    use({
        "j-hui/fidget.nvim",
        config = get_config("fidget"),
    })
    use({
        "folke/lua-dev.nvim",
    })

    -- for formatters and linters
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = get_config("null-ls"),
    })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
        },
        config = get_config("telescope"),
    })
    use({ "LinArcX/telescope-env.nvim" })
    use({
        "AckslD/nvim-neoclip.lua",
        requires = {
            { "tami5/sqlite.lua", module = "sqlite" },
            { "nvim-telescope/telescope.nvim" },
        },
        config = get_config("neoclip"),
    })
    use({ "jvgrootveld/telescope-zoxide" })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = get_config("treesitter"),
    })
    use({
        "windwp/nvim-ts-autotag",
        requires = { "nvim-treesitter/nvim-treesitter" },
        config = get_config("ts-autotag"),
    })
    use({
        "lewis6991/nvim-treesitter-context",
        requires = { "nvim-treesitter/nvim-treesitter" },
        config = get_config("treesitter-context"),
    })
    -- use({
    -- 	"nvim-treesitter/nvim-treesitter-textobjects",
    -- 	requires = { "nvim-treesitter/nvim-treesitter" },
    -- 	config = get_config("treesitter-textobjects"),
    -- })


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
        requires = { "MunifTanjim/nui.nvim" },
        config = get_config("dressing"),
    })

    use({
        "sunjon/Shade.nvim",
        config = get_config("shade"),
    })

    use({
        "nvim-treesitter/nvim-tree-docs",
    })

    use({
        "petertriho/nvim-scrollbar",
        config = get_config("scrollbar"),
    })

    use({
        "danymat/neogen",
        config = get_config("neogen"),
        requires = { "nvim-treesitter/nvim-treesitter" },
        -- Uncomment next line if you want to follow only stable versions
        -- tag = "*"
    })

    use({
        "rlane/pounce.nvim",
        config = get_config("pounce"),
    })

    use({
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        module = "persistence",
        config = get_config("persistence"),
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
