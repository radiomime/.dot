return {
  "folke/which-key.nvim",
  -- opts = function(_, opts)
  --   if LazyVim.has("noice.nvim") then
  --     opts.defaults["<leader>sn"] = { name = "+noice" }
  --   end
  -- end,
  -- opts = {
  --   defaults = {
  --     ["<leader>t"] = { name = "test" },
  --   },
  -- },
  keys = {
    {
      "<leader>v",
      "<cmd>vsplit<cr>",
      mode = { "n" }, -- unnecessary, normal mode assumed
      desc = "Vertical split",
    },
    {
      "<leader>ww",
      "<cmd>w<cr>",
      -- ":w",
      desc = "Write File",
    },
    {
      "<leader>W",
      "<cmd>wa<cr>",
      mode = { "n" },
      desc = "Write All Files",
    },
    {
      "<leader>j",
      "<cmd>terminal<cr>",
      -- mode = { "n" },
      desc = "terminal",
    },
  },
}
