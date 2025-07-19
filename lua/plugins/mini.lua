return {
	"echasnovski/mini.nvim",
	lazy = false, -- mini.nvim loads very fast
	config = function()
		-- mini.icons
		local icons = require("mini.icons")
		icons.setup()
		icons.mock_nvim_web_devicons()

		-- mini.files
		local files = require("mini.files")
		files.setup()
		vim.keymap.set("n", "-", function()
			files.open()
		end, { desc = "Open Folder Tree" })

		-- mini.sessions
		require("mini.sessions").setup()
	end,
}
