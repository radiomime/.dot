require("options")
require("keymaps")
require("plugins").install()
require("colorscheme")

require("plugins").configure()

--require("plugins.cmp")
-- from scratch below
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
-- require "user.project"
require("user.impatient")
require("user.indentline")
require("user.alpha")

require("plugins.whichkey")
-- require "user.whichkey"

require("user.autocommands")
