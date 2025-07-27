return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    -- Make sure packages are added to PATH
    "mason-org/mason.nvim",

    -- Auto-completion
    "saghen/blink.cmp",
  },
  config = function()
    -- Enable LSP
    vim.lsp.enable({
      "clangd",
      "lua_ls",
      "neocmake",
    })
    -- Run when an LSP attaches to a particular buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("my-lsp", { clear = true }),
      callback = function(event)
        -- Create a function to make mapping easier
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        local picker = require("snacks.picker")
        -- Find references for the word under your cursor.
        map("grr", picker.lsp_references, "[G]oto [R]eferences")

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map("gri", picker.lsp_implementations, "[G]oto [I]mplementation")

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map("grd", picker.lsp_definitions, "[G]oto [D]efinition")

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map("grD", picker.lsp_declarations, "[G]oto [D]eclaration")

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map("gO", picker.lsp_symbols, "Open Document Symbols")

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map("gW", picker.lsp_workspace_symbols, "Open Workspace Symbols")

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map("grt", picker.lsp_type_definitions, "[G]oto [T]ype Definition")

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Auto-completion or comment to use blink.cmp instead
        -- if client and client:supports_method("textDocument/completion") then
        --   -- Optional: trigger autocompletion on EVERY keypress. May be slow!
        --   local chars = {}
        --   for i = 32, 126 do
        --     table.insert(chars, string.char(i))
        --   end
        --   client.server_capabilities.completionProvider.triggerCharacters = chars
        --
        --   vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        -- end

        -- Create keymap to toggle inlay hints
        if client and client:supports_method("textDocument/inlayHint", event.buf) then
          map("<Leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "[T]oggle Inlay [H]ints")
        end

        -- Highlight references of the word under cursor
        if client and client:supports_method("textDocument/documentHighlight") then
          local highlight_augroup = vim.api.nvim_create_augroup("my-lsp-highlight", { clear = false })
          -- Highlight the word under the cursor
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          -- Clear references when cursor moves
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          -- Clean up highlight autocmds on LspDetach
          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("my-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "my-lsp-highlight", buffer = event2.buf })
            end,
          })
        end

        -- Auto-format on save or comment to use conform.nvim instead
        -- if client and not client:supports_method("textDocument/willSaveWaitUntil") and client:supports_method("textDocument/format") then
        --   vim.api.nvim_create_autocmd("BufWritePre", {
        --     group = vim.api.nvim_create_augroup("my-lsp-format", { clear = true }),
        --     buffer = event.buf,
        --     callback = function()
        --       vim.lsp.buf.format({ bufnr = event.buf, id = client.id, timeout_ms = 1000 })
        --     end,
        --   })
        -- end
      end,
    })

    -- Diagnostic Config
    vim.diagnostic.config({
      severity_sort = true,
      float = { border = "rounded", source = "if_many" },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚",
          [vim.diagnostic.severity.WARN] = "󰀪",
          [vim.diagnostic.severity.INFO] = "󰋽",
          [vim.diagnostic.severity.HINT] = "󰌶",
        },
      },
      virtual_lines = {
        current_line = true,
      },
    })
  end,
}
