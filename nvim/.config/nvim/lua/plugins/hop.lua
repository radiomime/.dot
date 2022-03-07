local M = {}

-- TODO: do I need this configuration?
-- I could set some custom keys and other options
-- checkout :h hop.setup
function M:configure()
  print("configuring hop")
  local status_ok, hop = pcall(require, "hop")
  if not status_ok then
    return
  end

  hop.setup({
    keys = "asdfjkl;ghqwertyuiopzxcvbnm",
    -- multi_windows = true, -- interesting option TODO debate this
  })
end

M.configure()

return M
