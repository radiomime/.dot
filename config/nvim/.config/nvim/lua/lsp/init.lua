local M = {}
local Log = require "core.log"

function M.config()
  vim.lsp.protocol.CompletionItemKind = neo.lsp.completion.item_kind

  for _, sign in ipairs(neo.lsp.diagnostics.signs.values) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  require("lsp.handlers").setup()
end

local function lsp_highlight_document(client)
  if neo.lsp.document_highlight == false then
    return -- we don't need further
  end
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function add_lsp_buffer_keybindings(bufnr)
  local status_ok, wk = pcall(require, "which-key")
  if not status_ok then
    return
  end

  local keys = {
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
    ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Goto references" },
    ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation" },
    ["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "show signature help" },
    ["gp"] = { "<cmd>lua require'lsp.peek'.Peek('definition')<CR>", "Peek definition" },
    ["gl"] = {
      "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })<CR>",
      "Show line diagnostics",
    },
  }
  wk.register(keys, { mode = "n", buffer = bufnr })
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  return capabilities
end

function M.get_ls_capabilities(client_id)
  local client
  if not client_id then
    local buf_clients = vim.lsp.buf_get_clients()
    for _, buf_client in ipairs(buf_clients) do
      if buf_client.name ~= "null-ls" then
        client_id = buf_client.id
        break
      end
    end
  end
  if not client_id then
    error "Unable to determine client_id"
  end

  client = vim.lsp.get_client_by_id(tonumber(client_id))

  local enabled_caps = {}

  for k, v in pairs(client.resolved_capabilities) do
    if v == true then
      table.insert(enabled_caps, k)
    end
  end

  return enabled_caps
end

function M.common_on_init(client, bufnr)
  if neo.lsp.on_init_callback then
    neo.lsp.on_init_callback(client, bufnr)
    Log:get_default().info "Called lsp.on_init_callback"
    return
  end

  local formatters = neo.lang[vim.bo.filetype].formatters
  if not vim.tbl_isempty(formatters) and formatters[1]["exe"] ~= nil and formatters[1].exe ~= "" then
    client.resolved_capabilities.document_formatting = false
    Log:get_default().info(
      string.format("Overriding language server [%s] with format provider [%s]", client.name, formatters[1].exe)
    )
  end
end

function M.common_on_attach(client, bufnr)
  if neo.lsp.on_attach_callback then
    neo.lsp.on_attach_callback(client, bufnr)
    Log:get_default().info "Called lsp.on_init_callback"
  end
  lsp_highlight_document(client)
  add_lsp_buffer_keybindings(bufnr)
  require("lsp.null-ls").setup(vim.bo.filetype)
end

function M.setup(lang)
  -- TODO: create a utility function for pcal requires and ok status
  -- local lsp_status_ok, _ = pcall(require, "lspconfig")
  -- if not lsp_status_ok then
  --   return
  -- end
  print('*** setting up lsp for language: ' .. lang)

  local lsp_utils = require "lsp.utils"
  local lsp = neo.lang[lang].lsp
  print('checking if' .. lsp.provider .. 'is active')
  if lsp_utils.is_client_active(lsp.provider) then
    return
  end

  -- TODO: remove and remove references
  -- local overrides = neo.lsp.override
  -- if type(overrides) == "table" then
  --   if vim.tbl_contains(overrides, lang) then
  --     return
  --   end
  -- end

  -- TODO: auto install server, or see what is exposed vi nvim-lsp-installer
  -- local servers = require "nvim-lsp-installer.servers"
  -- local server_available, requested_server = servers.get_server(server_name)
  -- if not requested_server:is_installed() then
  --   requested_server:install()
  -- end


  -- setup server
  if lsp.provider ~= nil and lsp.provider ~= "" then
    print('*** I am here!!')
    local lsp_installer_servers = require'nvim-lsp-installer.servers'
    local server_available, requested_server = lsp_installer_servers.get_server(lsp.provider)

    -- TODO: separate into get setup function?
    if not lsp.setup.on_attach then
      lsp.setup.on_attach = M.common_on_attach
    end
    if not lsp.setup.on_init then
      lsp.setup.on_init = M.common_on_init
    end
    if not lsp.setup.capabilities then
      lsp.setup.capabilities = M.common_capabilities()
    end

    -- print('*** below is lsp setup!!!')
    -- print(vim.inspect(lsp.setup))

    -- lspconfig[lsp.provider].setup(lsp.setup)

    if server_available then
        requested_server:on_ready(function ()
            -- local opts = {}
            -- requested_server:setup(opts)
            requested_server:setup(lsp.setup)
        end)
        if not requested_server:is_installed() then
            -- Queue the server to be installed
            requested_server:install()
        end
    else
       print('ahh shucks! TODO, change this, but your server is not avaialbalasdfad')
    end

    -- local lspconfig = require "lspconfig"

    -- if not lsp.setup.on_attach then
    --   lsp.setup.on_attach = M.common_on_attach
    -- end
    -- if not lsp.setup.on_init then
    --   lsp.setup.on_init = M.common_on_init
    -- end
    -- if not lsp.setup.capabilities then
    --   lsp.setup.capabilities = M.common_capabilities()
    -- end

    -- print('*** below is lsp setup!!!')
    -- print(vim.inspect(lsp.setup))

    -- lspconfig[lsp.provider].setup(lsp.setup)
  end
end

return M
