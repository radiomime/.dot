require("options")
require("keymaps")
require("lazy_plugins")
require("plugins").install({})
require("colorscheme")
require("plugins.cmp") -- TODO: do I need to configure cmp before lsp?
require("lsp")
require("plugins").configure({})
require("autocommands")
