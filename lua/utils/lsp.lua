local M = {}

M.on_attach = function(client, bufnr)
  if not client then
    vim.notify("LSP on_attach missing client", vim.log.levels.WARN)
    return
  end
  
  -- Use vim.api.nvim_buf_set_keymap instead of vim.keymap.set
  local opts_base = { noremap = true, silent = true }
  
  local function set_keymap(mode, lhs, rhs, desc)
    local opts = vim.tbl_extend('force', opts_base, { desc = desc })
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
  end
  
  -- === Core LSP keymaps ===
  set_keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition")
  set_keymap("n", "<leader>gS", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", "Goto Definition (vsplit)")
  set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action")
  set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
  set_keymap("n", "<leader>fc", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", "Format Code")
  set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Docs")
  
  -- === Diagnostics keymaps ===
  set_keymap("n", "<leader>pd", "<cmd>lua vim.diagnostic.jump({ count = -1 })<CR>", "Diagnostics: Previous")
  set_keymap("n", "<leader>nd", "<cmd>lua vim.diagnostic.jump({ count = 1 })<CR>", "Diagnostics: Next")
  
  -- === Organize Imports ===
  -- Use the new method instead of deprecated supports_method
  if client:supports_method("textDocument/codeAction") then
    vim.keymap.set("n", "<leader>oi", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" }, diagnostics = {} },
        apply = true,
        bufnr = bufnr,
      })
      vim.defer_fn(function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end, 50)
    end, { buffer = bufnr, desc = "Organize Imports" })
  end
  
  -- === DAP integration ===
  local has_dap = pcall(require, "dap")
  if has_dap then
    set_keymap("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", "DAP: Continue")
    set_keymap("n", "<leader>do", "<cmd>lua require('dap').step_over()<CR>", "DAP: Step Over")
    set_keymap("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>", "DAP: Step Into")
    set_keymap("n", "<leader>du", "<cmd>lua require('dap').step_out()<CR>", "DAP: Step Out")
    set_keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", "DAP: Breakpoint")
    set_keymap("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>", "DAP: Open REPL")
    set_keymap("n", "<leader>dx", "<cmd>lua require('dap').terminate()<CR>", "DAP: Terminate")
    
    local has_dapui = pcall(require, "dapui")
    if has_dapui then
      set_keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", "DAP: Toggle UI")
    end
  end
end

return M
