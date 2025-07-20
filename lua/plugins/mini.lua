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
		vim.keymap.set("n", "\\", function()
			files.open()
		end, { desc = "Open Folder Tree" })

		-- -- mini.jump
		-- require("mini.jump").setup()

		-- mini.jump2d
		require("mini.jump2d").setup({
			mappings = {
				start_jumping = "<Leader>j",
			},
		})

		-- mini.indentscope
		require("mini.indentscope").setup({
			draw = {
				animation = require("mini.indentscope").gen_animation.none(),
			},
		})

		-- mini.pairs
		require("mini.pairs").setup()
	end,
}
