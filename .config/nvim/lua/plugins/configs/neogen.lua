local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
	vim.notify("neogen not loaded", vim.log.levels.ERROR)
	return
end

neogen.setup({
	enabled = true, --if you want to disable Neogen
	input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
	-- jump_map = "<C-e>"       -- (DROPPED SUPPORT, see [here](#cycle-between-annotations) !) The keymap in order to jump in the annotation fields (in insert mode)
})
