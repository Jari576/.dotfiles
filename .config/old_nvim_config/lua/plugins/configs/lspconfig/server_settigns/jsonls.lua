local schemas
local status_ok, schemastore = pcall(require, "schemastore")
if status_ok then
    schemas = schemastore.json.schemas()
else
    vim.notify("schemastore not available", vim.log.levels.WARN)
    schemas = {}
end

local opts = {
	settings = {
		json = {
			schemas = schemas,
		},
	},
	setup = {
		commands = {
			Format = {
				function()
					vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
				end,
			},
		},
	},
}

return opts

