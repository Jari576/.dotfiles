
local status_ok, shade = pcall(require, "shade")
if not status_ok then
    vim.notify("shade not loaded", "error")
    return
end

shade.setup({
  overlay_opacity = 50,
})
