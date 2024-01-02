local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("LSP not loaded", vim.log.levels.ERROR)
    return
end

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
    -- disable virtual text
    virtual_text = true,
    -- show signs
    signs = {
        active = signs,
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

local default_config_file, default = pcall(require, "plugins.configs.lspconfig.server_settigns.default")
if default_config_file then
    lspconfig.util.default_config = vim.tbl_extend(
        "force",
        lspconfig.util.default_config,
        default
    )
end
