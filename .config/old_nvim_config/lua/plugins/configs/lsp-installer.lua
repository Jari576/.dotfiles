local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    vim.notify("lsp_installer not loaded", vim.log.levels.ERROR)
    return
end

local function get_server_config(server)
    local config_file, config = pcall(require, "plugins.configs.lspconfig.server_settigns." .. server.name)
    if config_file then
        return config
    end
    return {}
end

vim.cmd [[
    function! s:deregister_autocmd() abort
        " Disables the self-closing behavior of the window
        autocmd TextChanged <buffer> ++once autocmd! LspInstallerWindow
    endfunction

    " For a right-aligned window
    autocmd FileType lsp-installer wincmd L | call s:deregister_autocmd()
]]
-- do this when a ls is established
lsp_installer.on_server_ready(function(server)
    server:setup(get_server_config(server))
end)
