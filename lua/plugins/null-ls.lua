return {
  "nvimtools/none-ls.nvim",
  dependencies = { "mason-org/mason.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    -- ✅ Create augroup once
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        formatting.clang_format.with({
          filetypes = { "c", "cpp", "objc", "objcpp" },
        }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          -- ✅ Clear existing autocmds for this buffer + group
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}

