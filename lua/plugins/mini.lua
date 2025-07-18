return {
	"echasnovski/mini.nvim",
	lazy = false, -- mini.nvim loads very fast
	config = function()
		-- mini.icons
		local icons = require("mini.icons")
		icons.setup()
		icons.mock_nvim_web_devicons()

		-- mini.files
		require("mini.files").setup()
	end,
}
