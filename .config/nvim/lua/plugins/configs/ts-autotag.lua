local status_ok, autotag = pcall(require, "nvim-ts-autotag")
if not status_ok then
	vim.notify("autotag not loaded", "error")
	return
end

autotag.setup()
