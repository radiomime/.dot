return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "catppuccin/nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "catppuccin-mocha",
    },
  },
}
