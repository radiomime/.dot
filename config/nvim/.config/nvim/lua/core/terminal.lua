local M = {}
local utils = require("utils")

M.config = function()
    neo.builtin["terminal"] = {
        on_config_done = nil,
        -- size can be a number or function which is passed the current terminal
        size = 20,
        open_mapping = [[<c-t>]], -- ctrl-t opens and closes the terminal
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = { "none" },
        shade_terminals = true,
        shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = false,
        direction = "float", -- 'vertical' | 'horizontal' | 'window' | 'float'
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
        -- This field is only relevant if direction is set to 'float'
        float_opts = {
            -- The border key is *almost* the same as 'nvim_win_open'
            -- see :h nvim_win_open for details on borders however
            -- the 'curved' border is a custom border type
            -- not natively supported but implemented in this plugin.
            -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
            border = "curved",
            -- width = <value>,
            -- height = <value>,
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
        -- Add executables on the config.lua
        -- { exec, keymap, name}
        -- neo.builtin.terminal.execs = {{}} to overwrite
        -- neo.builtin.terminal.execs[#neo.builtin.terminal.execs+1] = {"gdb", "tg", "GNU Debugger"}
        execs = {
            { "lazygit", "gg", "LazyGit" },
            { "btm", "jb", "Bottom" },
        },
    }
end

M.setup = function()
    local terminal = require("toggleterm")
    for _, exec in pairs(neo.builtin.terminal.execs) do
        require("core.terminal").add_exec(exec[1], exec[2], exec[3])
    end
    terminal.setup(neo.builtin.terminal)

    if neo.builtin.terminal.on_config_done then
        neo.builtin.terminal.on_config_done(terminal)
    end
end

M.add_exec = function(exec, keymap, name)
    vim.api.nvim_set_keymap(
        "n",
        "<leader>" .. keymap,
        "<cmd>lua require('core.terminal')._exec_toggle('" .. exec .. "')<CR>",
        { noremap = true, silent = true }
    )
    neo.builtin.which_key.mappings[keymap] = name
end

M._split = function(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

M._exec_toggle = function(exec)
    local binary = M._split(exec)[1]
    if vim.fn.executable(binary) ~= 1 then
        local Log = require("core.log")
        Log:get_default().error(
            "Unable to run executable "
                .. binary
                .. ". Please make sure it is installed properly."
        )
        return
    end
    local Terminal = require("toggleterm.terminal").Terminal
    local exec_term = Terminal:new({ cmd = exec, hidden = true })
    exec_term:toggle()
end

local function get_log_path(name)
    --handle custom paths not managed by Plenary.log
    local logger = require("core.log")
    local file
    if name == "nvim" then
        file = CACHE_PATH .. "/log"
    else
        file = logger:new({ plugin = name }):get_path()
    end
    if utils.is_file(file) then
        return file
    end
end

---Toggles a log viewer according to log.viewer.layout_config
---@param name can be the name of any of the managed logs, e,g. "lunarvim" or the default ones {"nvim", "lsp", "packer.nvim"}
M.toggle_log_view = function(name)
    local logfile = get_log_path(name)
    if not logfile then
        return
    end
    local term_opts = vim.tbl_deep_extend("force", neo.builtin.terminal, {
        cmd = neo.log.viewer.cmd .. " " .. logfile,
        open_mapping = neo.log.viewer.layout_config.open_mapping,
        direction = neo.log.viewer.layout_config.direction,
        -- TODO: this might not be working as expected
        size = neo.log.viewer.layout_config.size,
        float_opts = neo.log.viewer.layout_config.float_opts,
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local log_view = Terminal:new(term_opts)
    -- require("core.log"):get_default().debug("term", vim.inspect(term_opts))
    log_view:toggle()
end

M.lazygit = function()
    -- lazygit:toggle()
    -- local terminal = require("toggleterm").Terminal
    local terminal = require("toggleterm.terminal").Terminal
    print(terminal)

    local lazygit = terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
            border = "double",
        },

        -- function to run on opening the terminal
        on_open = function(term)
            vim.cmd("startinsert!")
            vim.api.nvim_buf_set_keymap(
                term.bufnr,
                "n",
                "q",
                "<cmd>close<CR>",
                { noremap = true, silent = true }
            )
        end,

        -- function to run on closing the terminal
        on_close = function(term)
            print("Closing terminal")
        end,
    })

    lazygit:toggle()
end

return M