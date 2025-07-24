return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  dependencies = { "mason-org/mason.nvim" },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = {}
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 1000,
          lsp_format = "fallback",
        }
      end
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      cmake = { "gersemi" },
    },
  }
}
