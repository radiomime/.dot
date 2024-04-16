local M = {}

function M:configure()
  vim.g.symbols_outline = {
    show_guides = false,
    auto_preview = true,
    position = "right",
    show_numbers = true,
    show_relative_numbers = true,
    show_symbol_details = true,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
      close = { "<Esc>", "q" },
      goto_location = "<Cr>",
      focus_location = "f",
      hover_symbol = "<C-space>",
      toggle_preview = "K",
      rename_symbol = "r",
      code_actions = "a",
    },
  }
end

M.configure()

return M
