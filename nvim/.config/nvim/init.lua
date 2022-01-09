require("options")
require("keymaps")
require("plugins").install()
require("colorscheme")

-- configure cmp before lsp. TODO: is this necessary?
require("plugins.cmp")

require("lsp")

require("plugins").configure()

-- from scratch below
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
