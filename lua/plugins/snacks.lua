return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		dashboard = {
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{ icon = "", key = "t", desc = "Folder Tree", action = ":lua MiniFiles.open()" },
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		picker = {},
	},
	keys = {
		{
			"<Leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "[S]earch [H]elp",
		},
		{
			"<Leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "[S]earch [K]eymaps",
		},
		{
			"<Leader>sf",
			function()
				Snacks.picker.files()
			end,
			desc = "[S]earch [F]iles",
		},
		{
			"<Leader>ss",
			function()
				Snacks.picker.pickers()
			end,
			desc = "[S]earch [S]elect pickers",
		},
		{
			"<Leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "[S]earch current [W]ord",
			mode = { "n", "x" },
		},
		{
			"<Leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "[S]earch by [G]rep",
		},
		{
			"<Leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "[S]earch [D]iagnostics",
		},
		{
			"<Leader>sr",
			function()
				Snacks.picker.resume()
			end,
			desc = "[S]earch [R]esume",
		},
		{
			"<Leader>s.",
			function()
				Snacks.picker.recent()
			end,
			desc = '[S]earch Recent Files ("." for repeat)',
		},
		{
			"<Leader>sb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "[S]earch open [B]uffers",
		},
		{
			"<Leader><Leader>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<Leader>/",
			function()
				Snacks.picker.lines()
			end,
			desc = "[/] Fuzzily search in current buffer",
		},
		{
			"<Leader>s/",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "[S]earch [/] in open files",
		},
		{
			"<Leader>sn",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[S]earch [N]eovim files",
		},
	},
}
