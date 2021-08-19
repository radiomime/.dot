print('processing lua init script')

require "lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand="luafmt ${-i:tabWidth} --stdin",
            formatStdin = true,
                -- formatCommand = "lua-format -i",
            -- formatStdin = true,
        }
            }
        }
    }
}
