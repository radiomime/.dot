local M = {}
function M:configure()
  -- print("configuring comment")
  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    print("error: cannot call comment to configure")
    return
  end

  comment.setup({
    --- TODO: There are some conflicting keymaps here
    ---LHS of toggle mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
      ---Line-comment toggle keymap
      line = "gcl",
      ---Block-comment toggle keymap
      block = "gcb",
    },
  })
end

M.configure()

return M
