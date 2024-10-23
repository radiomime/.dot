-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  print("loading vscode")
  require("vs.init")
-- elseif true then
elseif false then
  print("loading kickstart...")
else
  print("loading lazyvim")
  require("config.lazy")
end
