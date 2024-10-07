local augroup = vim.api.nvim_create_augroup("LspFormating", {})
local config = require("plugins.config.lspconfig")
local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  capabilities = config.capabilities,
  filetypes = {"python"},
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end
})
