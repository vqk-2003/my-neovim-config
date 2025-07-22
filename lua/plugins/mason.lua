return {
  "mason-org/mason.nvim",
  cmd = "Mason",
  config = function()
    require("mason").setup()

    -- These are package names sourced from the Mason registry,
    -- and may not necessarily match the server names used in lspconfig
    local ensure_installed = { -- Language server
      "clangd", -- C/C++
      "neocmakelsp", -- CMake
      "lua-language-server", -- Lua

      -- Formatter
      "clang-format", -- C/C++
      "stylua", -- Lua

      -- Linter

      -- Debugger
      "codelldb", -- C/C++/Rust
    }

    -- Stole from LazyVim
    -- https://github.com/LazyVim/LazyVim/blob/25abbf546d564dc484cf903804661ba12de45507/lua/lazyvim/plugins/lsp/init.lua#L285
    local registry = require("mason-registry")
    -- Ensure packages are installed
    registry.refresh(function()
      for _, name in pairs(ensure_installed) do
        local package = registry.get_package(name)
        if not package:is_installed() then
          package:install()
        end
      end
    end)
  end,
}
