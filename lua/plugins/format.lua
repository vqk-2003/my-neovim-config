return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  dependencies = { "mason-org/mason.nvim" },
  keys = {
    {
      "<Leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "never" })
      end,
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = nil, -- Disable format on save
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      cmake = { "gersemi" },
      rust = { "rustfmt" },
    },
  },
}
