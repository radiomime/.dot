local M = {}

-- TODO: Move this to some function or config to call before start!
function M:setup()
    vim.g.dashboard_default_executive = 'telescope'
    vim.g.dashboard_disable_at_vimenter = 1
    -- vim.g.dashboard_session_directory = utils.join_paths(get_cache_dir(), "sessions")
    -- vim.g.dashboard_custom_header = {'what'}

    vim.g.dashboard_custom_section = {
      a = {
        description = { "  Find File          " },
        command = "Telescope find_files",
      },
      b = {
        description = { "  New File           " },
        command = ":ene!",
      },
      c = {
        description = { "  Recent Projects    " },
        command = "Telescope projects",
      },
      d = {
        description = { "  Recently Used Files" },
        command = "Telescope oldfiles",
      },
      e = {
        description = { "  Find Word          " },
        command = "Telescope live_grep",
      },
      -- f = {
      --   description = { "  Configuration      " },
      --   command = ":e " .. config.user_config_file,
      -- },
    }

    -- local num_plugins_loaded = #vim.fn.globpath(get_runtime_dir() .. "/site/pack/packer/start", "*", 0, 1)
    -- num_plugins_loaded <-- could have this in footer

    -- vim.g.dashboard_custom_footer = { '6 seasons and a movie' }


    -- local ll = require('lualine')
    -- ll.setup({
    -- })
end

return M
