return {
  "mason-org/mason.nvim",
  lazy = true,
  config = function()
    require("mason").setup()

    -- These are package names sourced from the Mason registry,
    -- and may not necessarily match the server names used in lspconfig
    local ensure_installed = {
      -- Install clang tools for C/C++ using external package manager
      -- Language server
      -- "clangd",
      "neocmakelsp", -- CMake
      "lua-language-server", -- Lua

      -- Formatter
      -- "clang-format",
      "stylua", -- Lua
      "gersemi", -- CMake

      -- Linter

      -- Debugger
      "codelldb", -- C/C++/Rust
    }

    -- Stole from LazyVim and mason-nvim-dap.nvim
    -- https://github.com/LazyVim/LazyVim/blob/25abbf546d564dc484cf903804661ba12de45507/lua/lazyvim/plugins/lsp/init.lua#L285
    -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/86389a3dd687cfaa647b6f44731e492970034baa/lua/mason-nvim-dap/ensure_installed.lua#L16
    local registry = require("mason-registry")
    -- Ensure packages are installed
    registry.refresh(function()
      for _, name in pairs(ensure_installed) do
        local package = registry.get_package(name)
        if not package:is_installed() then
          vim.notify(("Installing %s"):format(package.name))
          package:install():once(
            "closed",
            vim.schedule_wrap(function()
              if package:is_installed() then
                vim.notify(("%s was installed"):format(package.name))
              end
            end)
          )
        end
      end
    end)
  end,
}
