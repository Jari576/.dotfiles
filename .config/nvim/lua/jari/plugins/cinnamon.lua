return {
	"declancm/cinnamon.nvim",
	config = function()
		local cinnamon = require("cinnamon")

		cinnamon.setup({
            disabled = false,
			-- KEYMAPS
            keymaps = {
                basic = true, -- enable default keymaps.
                extra = true, -- enable extra keymaps.
            },
			-- OPTIONS
            options = {
                mode = "cursor",
                delay = 4, -- The default delay (in ms) between each line when scrolling.
                max_delta = {
                    -- Max number of lines moved before scrolling is skipped.
                    -- Setting to -1 will disable this option.
                    line = 150,
                    -- Maximum length (in ms) of a command.
                    -- The line delay will be re-calculated. Setting to -1 will disable this option. 
                    time = 1000,
                },
            },
		})
	end,
}
