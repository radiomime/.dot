local M = {}
function M:configure()
  -- print("configuring comment")
  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    print("error: cannot call comment to configure")
    return
  end

  comment.setup({
    ---Add a space b/w comment and the line
    ---@type boolean
    padding = true,

    ---Whether the cursor should stay at its position
    ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
    ---@type boolean
    sticky = true,

    --- TODO: There are some conflicting keymaps here
    ---LHS of toggle mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
      ---line-comment keymap
      line = "gcl",
      ---block-comment keymap
      block = "gbc",
    },
    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    opleader = {
      ---line-comment keymap
      line = "gc",
      ---block-comment keymap
      block = "gb",
    },

    pre_hook = function(ctx)
      local U = require("Comment.utils")

      local location = nil
      if ctx.ctype == U.ctype.block then
        location =
          require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location =
          require("ts_context_commentstring.utils").get_visual_start_location()
      end

      return require("ts_context_commentstring.internal").calculate_commentstring({
        key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
        location = location,
      })
    end,

    ---Post-hook, called after commenting is done
    ---@type function
    post_hook = nil,
  })
end

M.configure()

return M
