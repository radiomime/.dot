return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "hs" }, -- hammerspoon
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true, -- TODO: do I need this? I'm not sure
          ["/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/"] = true,
        },
      },
    },
  },
}
