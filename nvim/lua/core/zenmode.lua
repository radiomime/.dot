local M = {}

function M.config()
    neo.builtin.zenmode = {
        active = true,
        on_config_done = nil,
        window = { width = 10 },
    }
end

function M.setup()
    local nvim_zenmode = require("zen-mode")

    nvim_zenmode.setup(neo.builtin.zenmode)
    if neo.builtin.zenmode.on_config_done then
        neo.builtin.zenmode.on_config_done(nvim_zenmode)
    end
end

return M
