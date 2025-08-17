return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  event = "VeryLazy",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
      "c",
      "cpp",
      "rust",
      "python",
      "cmake",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "regex",
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- Disable automatic installation of missing parser when entering buffer
    auto_install = false,
    -- Syntax highlight
    highlight = {
      enable = true,
    },
    -- Indentation based on treesitter for the '=' operator
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
        scope_incremental = false,
      }
    }
  },
}
