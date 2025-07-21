return {
	-- Simple syntax tree navigation and swapping with h, j, k, l
	"aaronik/treewalker.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		highlight = false,
	},
	keys = {
		{ "<C-k>", "<cmd>Treewalker Up<CR>", desc = "Jump to prev neighbor node", mode = { "n", "v" } },
		{
			"<C-j>",
			"<cmd>Treewalker Down<CR>",
			desc = "Jump to next neighbor node",
			mode = { "n", "v" },
		},
		{ "<C-h>", "<cmd>Treewalker Left<CR>", desc = "Jump to parent node", mode = { "n", "v" } },
		{ "<C-l>", "<cmd>Treewalker Right<CR>", desc = "Jump to child node", mode = { "n", "v" } },

		{ "<C-A-k>", "<cmd>Treewalker SwapUp<CR>", desc = "Swap with the node above" },
		{ "<C-A-j>", "<cmd>Treewalker SwapDown<CR>", desc = "Swap with the node beneath" },
		{ "<C-A-h>", "<cmd>Treewalker SwapLeft<CR>", desc = "Swap with the left neighbor node" },
		{ "<C-A-l>", "<cmd>Treewalker SwapRight<CR>", desc = "Swap with the right neighbor node" },
	},
}
