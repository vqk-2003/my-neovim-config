return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy", -- faster startup time but might cause highlight delay
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"c",
			"cpp",
			"cmake",
			"rust",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>", -- Ctrl + Space doesn't work on Windows Terminal
				node_incremental = "<CR>",
				node_decremental = "<BS>",
				scope_incremental = false, -- set to `false` to disable one of the mappings
			},
		},
	},
}
