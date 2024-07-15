return {
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      {
        "<leader>gj",
        function()
          require("gitsigns").nav_hunk("next")
        end,
        desc = "Next Hunk",
      },
      {
        "<leader>gk",
        function()
          require("gitsigns").nav_hunk("prev")
        end,
        desc = "Previous Hunk",
      },
    },
  },
}
