return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  opts = {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
      "c",
      "cpp",
      "cmake",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
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
  },
}
