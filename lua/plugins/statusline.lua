return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "echasnovski/mini.nvim" }, -- Make sure mini.icons available
  opts = {
    options = {
      disabled_filetypes = {
        statusline = {
          "snacks_dashboard",
        },
      },
      globalstatus = true,
    },
  },
}
