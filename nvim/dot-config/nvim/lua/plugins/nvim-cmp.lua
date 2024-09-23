return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "supermaven",
        group_index = 1,
        priority = 100,
      })
      table.insert(opts.sources, 1, {
        name = "copilot",
        group_index = 1,
        priority = 99,
      })
    end,
  },
}
