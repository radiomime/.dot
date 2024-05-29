-- LSP keymaps updates...
return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    -- keys[#keys + 1] = { "", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "Goto Definition", has = "definition"}

    keys[#keys + 1] = {
      "gd",
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      desc = "Go to Definition",
      has = "definition",
    }

    -- disable a keymap
    -- keys[#keys + 1] = { "K", false }

    -- add a keymap
    -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
  end,
}
