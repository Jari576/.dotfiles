local status_ok, nlspsettings = pcall(require, "nlspsettings")
if not status_ok then
	vim.notify("nlspsettings not loaded", "error")
	return
end

nlspsettings.setup({
  local_settings_dir = ".nlsp-settings",
  local_settings_root_markers = { '.git' },
  append_default_schemas = true,
  loader = 'json'
})

