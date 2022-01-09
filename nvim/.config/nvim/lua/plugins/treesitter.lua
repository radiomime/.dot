local M = {}
function M:configure()
	print("configuring treesitter")
	local status_ok, configs = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		print("error: cannot configure treesitter inside configure function")
		return
	end

	configs.setup({
		ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
		ignore_install = { "" }, -- List of parsers to ignore installing
    -- TODO: is this from autopairs? Should it be moved into other plugin modules?
		autopairs = {
			enable = true,
		},
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = {}, -- list of language that will be disabled, e.g. {"latex", "c", "rust"}
			additional_vim_regex_highlighting = true,
		},
    -- TODO: keep indent experimental feature? could cause some issues
		indent = {
			enable = true,
			disable = { "yaml" }, -- {"python", "html", "javascript"},
		},
    -- other plugin modules
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
      -- config = {
      --   -- Languages that have a single comment style
      --   typescript = "// %s",
      --   css = "/* %s */",
      --   scss = "/* %s */",
      --   html = "<!-- %s -->",
      --   svelte = "<!-- %s -->",
      --   vue = "<!-- %s -->",
      --   json = "",
      -- },
		},
    -- TODO: use some of these?
    -- matchup = {
    --   enable = false, -- mandatory, false will disable the whole extension
    --   -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    -- },
    -- autotag = { enable = false },
    -- textobjects = {
    --   swap = {
    --     enable = false,
    --     -- swap_next = textobj_swap_keymaps,
    --   },
    --   -- move = textobj_move_keymaps,
    --   select = {
    --     enable = false,
    --     -- keymaps = textobj_sel_keymaps,
    --   },
    -- },
    -- textsubjects = {
    --   enable = false,
    --   keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" },
    -- },
    -- playground = {
    --   enable = false,
    --   disable = {},
    --   updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    --   persist_queries = false, -- Whether the query persists across vim sessions
    --   keybindings = {
    --     toggle_query_editor = "o",
    --     toggle_hl_groups = "i",
    --     toggle_injected_languages = "t",
    --     toggle_anonymous_nodes = "a",
    --     toggle_language_display = "I",
    --     focus_language = "f",
    --     unfocus_language = "F",
    --     update = "R",
    --     goto_node = "<cr>",
    --     show_help = "?",
    --   },
    -- },
    -- rainbow = {
    --   enable = false,
    --   extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    --   max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    -- },
	})
end

M.configure()

return M
