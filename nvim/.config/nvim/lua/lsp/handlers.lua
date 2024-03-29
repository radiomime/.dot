local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(
      sign.name,
      { texthl = sign.name, text = sign.text, numhl = "" }
    )
  end

  local config = {
    -- enable virtual text: enabled virtual text for diagnostics
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
      -- width = 60,
    })

  vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
      -- width = 60,
    })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  -- if client.resolved_capabilities.document_highlight then
  --   vim.api.nvim_exec(
  --     [[
  --     augroup lsp_document_highlight
  --       autocmd! * <buffer>
  --       autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
  --       autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
  --     augroup END
  --   ]],
  --     false
  --   )
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
  -- end
end

-- TODO: move these to keymaps file?
local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gD",
    "<cmd>lua vim.lsp.buf.declaration()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gd",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "K",
    "<cmd>lua vim.lsp.buf.hover()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gi",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<C-k>",
    "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    opts
  )
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gr",
    "<cmd>lua vim.lsp.buf.references()<CR>",
    opts
  )
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "[d",
    '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "]d",
    '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>q",
    "<cmd>lua vim.diagnostic.setloclist()<CR>",
    opts
  )
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    --[[ client.resolved_capabilities.document_formatting = false ]]
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
    -- client.resolved_capabilities.document_range_formatting = false
    -- when this breaks, see: https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflrcts

    -- TODO: are there cool other things in this plug in? I think so.
    local status_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
    if not status_ok then
      return
    end

    ts_utils.setup({
      filter_out_diagnostics_by_code = { 80001 },
    })

    ts_utils.setup_client(client)
    -- require('nvim-lsp-ts-utils').setup({
    --     filter_out_diagnostics_by_code = { 80001 },
    -- })
    -- require('nvim-lsp-ts-utils').setup_client(client)
  end

  if client.name == "sumneko_lua" then
    --[[ client.resolved_capabilities.document_formatting = false ]]
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
  end

  if client.name == "jsonls" then
    --[[ client.resolved_capabilities.document_formatting = false ]]
    client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

--[[ local capabilities = vim.lsp.protocol.make_client_capabilities() ]]
--[[ M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities) ]]
M.capabilities = cmp_nvim_lsp.default_capabilities()

return M
