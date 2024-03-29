local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	vim.notify("null_ls not loaded", vim.log.levels.ERROR)
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {
		-- formatting.prettier.with({
  --           disabled_filetypes = { "ts", "typescript", "typescriptreact", "js", "javascript", "javascriptreact", "tsx", "jsx", "json", "html" },
		-- 	extra_args = {},
		-- }),
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		-- formatting.stylua,
	},
})
