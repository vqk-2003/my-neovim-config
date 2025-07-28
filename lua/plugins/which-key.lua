return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 0,
    spec = {
      { "<Leader>s", group = "[S]earch" },
      { "<Leader>t", group = "[T]oggle" },
      { "<Leader>h", group = "Git [H]unk", mode = { "n", "v" } },
      { "gr", group = "LSP" },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
