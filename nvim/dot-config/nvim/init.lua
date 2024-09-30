-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  print("loading vscode")
  require("vs.init")
else
  print("loading non-vscode")
  require("config.lazy")
end
