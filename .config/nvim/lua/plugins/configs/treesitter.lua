local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("treesitter not loaded", "error")
	return
end

configs.setup({
	ensure_installed = "all",
	sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = {}, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {}, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		disable = { "" },
	},
    context_commentstring = {
    enable = true
  },
	tree_docs = {
		enable = true,
	},
})
