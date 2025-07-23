return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    -- Make sure packages are added to PATH
    "mason-org/mason.nvim",
    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    -- Enable LSP
    vim.lsp.enable({
      "clangd",
      "lua_ls",
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

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Auto-completion
        if client and client:supports_method("textDocument/completion") then
          -- Optional: trigger autocompletion on EVERY keypress. May be slow!
          local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
          client.server_capabilities.completionProvider.triggerCharacters = chars

          vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        end

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
            end
          })
        end

        -- Auto-format on save
        if client and not client:supports_method("textDocument/willSaveWaitUntil") and client:supports_method("textDocument/format") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("my-lsp-format", { clear = true }),
            buffer = event.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = event.buf, id = client.id, timeout_ms = 1000 })
            end,
          })
        end
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
        }
      },
      virtual_lines = {
        current_line = true,
      }
    })
  end,
}
