local M = {}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = 'float',
    hidden = true,
})

function M:_lazygit_toggle()
    lazygit:toggle()
end

function M:config()
    local tt = require('toggleterm')

    tt.setup({
      -- size can be a number or function which is passed the current terminal
      size = 20,
      -- size = function(term)
      --   if term.direction == "horizontal" then
      --     return 15
      --   elseif term.direction == "vertical" then
      --     return vim.o.columns * 0.4
      --   end
      -- end,

      open_mapping = [[<c-t>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      persist_size = false, -- non-default, does this make sense?
      direction = 'float', -- 'vertical' | 'horizontal' | 'window' | 'float',
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell, -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        -- width = <value>,
        -- height = <value>,
        winblend = 0, -- 3,
        highlights = {
          border = "Normal",
          background = "Normal",
        }
      }
    })
end

-- M.add_exec = function(exec, keymap, name)
--   vim.api.nvim_set_keymap(
--     "n",
--     "<leader>" .. keymap,
--     "<cmd>lua require('plugins.toggleterm')._exec_toggle('" .. exec .. "')<CR>",
--     { noremap = true, silent = true }
--   )
--   -- lvim.builtin.which_key.mappings[keymap] = name
-- end

return M
