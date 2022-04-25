local M = {}

-- TODO: add a keybind to open nvim tree in current buffer's path or with it open
function M:configure()
	-- print("configuring nvimtree")
	vim.g.nvim_tree_icons = {
		default = "",
		symlink = "",
		git = {
			unstaged = "", -- possible: "✗"
			staged = "✓", -- possible:  "S"
			unmerged = "",
			renamed = "➜",
			deleted = "",
			untracked = "★", -- possible: "U"
			ignored = "◌",
		},
		folder = {
			default = "",
			open = "",
			empty = "",
			empty_open = "",
			symlink = "",
			symlink_open = "",
		},
	}

	local status_ok, nvim_tree = pcall(require, "nvim-tree")
	if not status_ok then
		return
	end

	local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
	if not config_status_ok then
		return
	end

	local tree_cb = nvim_tree_config.nvim_tree_callback

	nvim_tree.setup({
		disable_netrw = true, -- TODO: explore this
		hijack_netrw = true, -- TODO: explore this
		open_on_setup = false,
		ignore_ft_on_setup = {
			"startify",
			"dashboard",
			"alpha",
		},
		auto_close = true,
		open_on_tab = false,
		hijack_cursor = false,
		update_cwd = false, -- `true` necessary for project.nvim
		update_to_buf_dir = {
			enable = true,
			auto_open = true,
		},
    -- TODO: enable later? This could be helpful, but currently causes errors
		diagnostics = {
			enable = false,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		update_focused_file = {
			enable = false, -- `true` necessary for project.nvim
			update_cwd = false, -- `true` necessary for project.nvim
			ignore_list = {},
		},
		system_open = {
			cmd = nil,
			args = {},
		},
		filters = {
			dotfiles = false,
			custom = {},
		},
		git = {
			enable = true,
			ignore = true,
			timeout = 500, -- default: 400
		},
		view = {
			width = 45,
      height = 30, -- only for top/bottom as 'side' value
			hide_root_folder = false,
			side = "left",
			auto_resize = true,
			mappings = {
				custom_only = false,
				list = {
					{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
					{ key = "h", cb = tree_cb("close_node") },
					{ key = "v", cb = tree_cb("vsplit") },
				},
			},
			number = true,
			relativenumber = true,
		},
    -- TODO: trash command on system! Do this, maybe use rip?
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
		quit_on_open = 0,
		git_hl = 1,
		disable_window_picker = 0,
		root_folder_modifier = ":t",
		show_icons = {
			git = 1,
			folders = 1,
			files = 1,
			folder_arrows = 1,
			tree_width = 30,
		},
	})
end

M.configure()

return M
