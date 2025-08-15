return {
  "echasnovski/mini.nvim",
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

    -- mini.pairs
    require("mini.pairs").setup()

    -- mini.notify
    require("mini.notify").setup()

    -- mini.clue
    local miniclue = require("mini.clue")
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),

        { mode = "n", keys = "<Leader>s", desc = "[S]earch" },
        { mode = "n", keys = "<Leader>t", desc = "[T]oggle" },
        { mode = { "n", "v" }, keys = "<Leader>h", desc = "Git [H]unk" },
      },

      window = {
        delay = 0,
      },
    })
  end,
}
