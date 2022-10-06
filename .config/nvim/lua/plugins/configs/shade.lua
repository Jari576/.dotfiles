local status_ok, shade = pcall(require, "shade")
if not status_ok then
    vim.notify("shade not loaded", vim.log.levels.ERROR)
    return
end

shade.setup({
    overlay_opacity = 50,
})
