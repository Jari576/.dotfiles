local status_ok, persistence = pcall(require, "persistence")
if not status_ok then
	vim.notify("persistence not loaded", vim.log.levels.ERROR)
	return
end

persistence.setup({
	dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"), -- directory where session files are saved
	options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
})
