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
      mode = { "n" },
      desc = "Vertical split",
    },
    {
      "<leader>w",
      "<cmd>w<cr>",
      mode = { "n" },
      desc = "Write File",
    },
    {
      "<leader>W",
      "<cmd>w<cr>",
      mode = { "n" },
      desc = "Write All Files",
    },
  },
}
