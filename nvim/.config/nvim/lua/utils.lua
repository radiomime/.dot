local utils = {}

function utils.get_data_path()
  return vim.fn.stdpath("data")
end

function utils.get_config_path()
  return vim.fn.stdpath("config")
end

function utils.get_shell()
  return os.getenv("SHELL")
end

function utils.get_home_dir()
  return vim.loop.os_homedir()
end

function utils.get_os_info()
  return vim.loop.os_uname()
end

function utils.file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

-- autoformat
-- function utils.toggle_autoformat()
--   require("autocmds").define_augroups({
--     autoformat = {
--       {
--         "BufWritePre",
--         "*",
--         ":silent lua vim.lsp.buf.formatting_sync()",
--       },
--     },
--   })
--
--   vim.cmd([[
--       if exists('#autoformat#BufWritePre')
--         :autocmd! autoformat
--       endif
--     ]])
-- end

function utils.unrequire(m)
  package.loaded[m] = nil
  _G[m] = nil
end


function utils.is_file(filename)
  local stat = vim.loop.fs_stat(filename)
  return stat and stat.type == "file" or false
end

return utils
