-- require plugins
local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, lsp_installer =
  pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

-- NOTE: add any new servers to be installed here. this gives lsp highlighting
local servers = {
  "jsonls",
  "sumneko_lua",
  "tsserver",
  "jedi_language_server",
  "clangd",
  "bashls",
}

-- mason needs to be setup first
mason.setup()

-- mason's lsp installer needs to be setup between mason and lspconfig
lsp_installer.setup({
  ensure_installed = servers,
  automatic_installation = false,
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts =
    pcall(require, "lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
  end

  -- lspconfig should be set up last
  lspconfig[server].setup(opts)
end
