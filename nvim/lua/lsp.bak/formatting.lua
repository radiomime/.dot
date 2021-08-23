print('lua lsp formatting script -- processing')


-- BREAK
-- BREAK
-- BREAK
-- BREAK

-- Credit below to lukas-reineke. clean this and see what I need
-- TODO: get this clean
-- local null_ls = require("null-ls")
-- local b = null_ls.builtins

-- local sources = {
--     b.formatting.prettierd.with({
--         filetypes = { "html", "json", "yaml", "markdown" },
--     }),
--     b.formatting.stylua.with({
--         condition = function(utils)
--             return utils.root_has_file("stylua.toml")
--         end,
--     }),
--     b.formatting.trim_whitespace.with({ filetypes = { "tmux", "teal", "zsh" } }),
--     b.formatting.shfmt,
--     b.diagnostics.write_good,
--     b.diagnostics.markdownlint,
--     b.diagnostics.teal,
--     b.diagnostics.shellcheck,
--     b.code_actions.gitsigns,
-- }

-- local M = {}
-- M.setup = function(on_attach)
--     null_ls.config({
--         -- debug = true,
--         sources = sources,
--     })
--     require("lspconfig")["null-ls"].setup({ on_attach = on_attach })
-- end

-- return M





-- BREAK
-- BREAK
-- BREAK
-- BREAK

-- local null_ls = require'null-ls'
-- -- /onatta
-- require("null-ls").config({
--     -- you must define at least one source for the plugin to work
--     sources = {
--     require("null-ls").builtins.formatting.stylua 
-- }
-- })

-- require("lspconfig")["null-ls"].setup({
--     -- see the nvim-lspconfig documentation for available configuration options
--     -- on_attach = cmd(msg hello)
-- })

-- null_ls.setup {
--   on_attach = function(client)
--     vim.cmd([[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]])
--   end,
--   sources = {
--     null_ls.builtins.formatting.stylua,
--   }
-- }
--
-- BREAKKKKK
-- BREAKKKKK
-- BREAKKKKK

-- local lsc = require('lspconfig')
-- local nls = require('null-ls')

-- local fmt = nls.builtins.formatting

-- -- Configuring null-ls
-- nls.config({
--     sources = {
--         fmt.trim_whitespace.with({
--             filetypes = { 'text', 'sh', 'zsh', 'yaml', 'toml', 'make', 'conf' },
--         }),
--         fmt.rustfmt,
--         fmt.stylua,
--         fmt.terraform_fmt,
--     },
-- })

-- -- Setting up null-ls server
-- -- NOTE: don't move this setup() call elsewhere
-- lsc['null-ls'].setup({
--     on_attach = function(client)
--         require('plugins.lsp.lsp-utils').fmt_on_save(client)
--     end,
-- })

-- BREAKKKKK
-- BREAKKKKK
-- BREAKKKKK

-- local utils = require "utils"
-- local M = {}

-- local format_disabled_var = function()
--     return string.format("format_disabled_%s", vim.bo.filetype)
-- end
-- local format_options_var = function()
--     return string.format("format_options_%s", vim.bo.filetype)
-- end

-- local format_options_prettier = {
--     tabWidth = 4,
--     singleQuote = true,
--     trailingComma = "all",
--     configPrecedence = "prefer-file"
-- }
-- vim.g.format_options_typescript = format_options_prettier
-- vim.g.format_options_javascript = format_options_prettier
-- vim.g.format_options_typescriptreact = format_options_prettier
-- vim.g.format_options_javascriptreact = format_options_prettier
-- vim.g.format_options_json = format_options_prettier
-- vim.g.format_options_css = format_options_prettier
-- vim.g.format_options_scss = format_options_prettier
-- vim.g.format_options_html = format_options_prettier
-- vim.g.format_options_yaml = format_options_prettier
-- vim.g.format_options_markdown = format_options_prettier
-- vim.g.format_options_sh = {
--     tabWidth = 4
-- }

-- M.formatToggle = function(value)
--     local var = format_disabled_var()
--     vim.g[var] = utils._if(value ~= nil, value, not vim.g[var])
-- end
-- vim.cmd [[command! FormatDisable lua require'lsp.formatting'.formatToggle(true)]]
-- vim.cmd [[command! FormatEnable lua require'lsp.formatting'.formatToggle(false)]]

-- M.format = function()
--     if not vim.g[format_disabled_var()] then
--         vim.lsp.buf.formatting(vim.g[format_options_var()] or {})
--     end
-- end

-- return M
