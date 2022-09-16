local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  print("error: null_ls is not callable")
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    --[[ js, ts ]]
    formatting.prettier, -- with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),

    --[[ lua ]]
    formatting.stylua, -- using sumneko, though that may have memory leaks

    --[[ shell files ]]
    formatting.shfmt.with({ extra_args = { "-i", "2" } }),
    formatting.shellharden,

    --[[ fish ]]
    formatting.fish_indent,

    --[[ python ]]
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.isort.with({ extra_args = { "--profile", "black" } }),
    -- diagnostics.flake8

    --[[ sql ]]
    formatting.sqlfluff.with({
      extra_args = { "--dialect", "bigquery" }, -- change to your dialect
    }),
  },

  -- uncomment on_attach fn below for format on save
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
    end
  end,
})
