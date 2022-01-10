-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
local M = {}

function M.setup()

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = neo.lsp.diagnostics.virtual_text,
    signs = neo.lsp.diagnostics.signs.active,
    underline = neo.lsp.document_highlight,
  })
  local config = { -- your config
    virtual_text = neo.lsp.diagnostics.virtual_text,
    signs = neo.lsp.diagnostics.signs,
    underline = neo.lsp.diagnostics.underline,
    update_in_insert = neo.lsp.diagnostics.update_in_insert,
    severity_sort = neo.lsp.diagnostics.severity_sort,
  }

  vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, _)
    local uri = result.uri
    local bufnr = vim.uri_to_bufnr(uri)
    if not bufnr then
      return
    end

    local diagnostics = result.diagnostics
    local ok, vim_diag = pcall(require, "vim.diagnostic")
    if ok then
      -- FIX: why can't we just use vim.diagnostic.get(buf_id)?
      config.signs = true
      for i, diagnostic in ipairs(diagnostics) do
        local rng = diagnostic.range
        diagnostics[i].lnum = rng["start"].line
        diagnostics[i].end_lnum = rng["end"].line
        diagnostics[i].col = rng["start"].character
        diagnostics[i].end_col = rng["end"].character
      end
      local namespace = vim.lsp.diagnostic.get_namespace(ctx.client_id)

      vim_diag.set(namespace, bufnr, diagnostics, config)
      if not vim.api.nvim_buf_is_loaded(bufnr) then
        return
      end
      vim_diag.show(namespace, bufnr, diagnostics, config)
    else
      vim.lsp.diagnostic.save(diagnostics, bufnr, ctx.client_id)
      if not vim.api.nvim_buf_is_loaded(bufnr) then
        return
      end
      vim.lsp.diagnostic.display(diagnostics, bufnr, ctx.client_id, config)
    end
  end

  -- vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _)
  --   local uri = params.uri
  --   local bufnr = vim.uri_to_bufnr(uri)

  --   if not bufnr then
  --     return
  --   end

  --   local diagnostics = params.diagnostics

  --   for i, v in ipairs(diagnostics) do
  --     local source = v.source
  --     if source then
  --       if string.find(source, "/") then
  --         source = string.sub(v.source, string.find(v.source, "([%w-_]+)$"))
  --       end
  --       diagnostics[i].message = string.format("%s: %s", source, v.message)
  --     else
  --       diagnostics[i].message = string.format("%s", v.message)
  --     end

  --     if vim.tbl_contains(vim.tbl_keys(v), "code") then
  --       diagnostics[i].message = diagnostics[i].message .. string.format(" [%s]", v.code)
  --     end
  --   end

  --   vim.lsp.diagnostic.save(diagnostics, bufnr, client_id)

  --   if not vim.api.nvim_buf_is_loaded(bufnr) then
  --     return
  --   end

  --   vim.lsp.diagnostic.display(diagnostics, bufnr, client_id, config)
  -- end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = neo.lsp.popup_border,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = neo.lsp.popup_border,
  })
end

return M
