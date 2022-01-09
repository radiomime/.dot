local M = {}
function M:configure()
	print("configuring autopairs")
	-- Setup nvim-cmp.
	local status_ok, npairs = pcall(require, "nvim-autopairs")
	if not status_ok then
		print("error: cannot call autopairs to configure")
		return
	end

	npairs.setup({
		check_ts = true,
		ts_config = {
			lua = { "string", "source" },
			javascript = { "string", "template_string" },
			java = false,
		},
		disable_filetype = { "TelescopePrompt", "spectre_panel" },
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
			offset = 0, -- Offset from pattern match
			end_key = "$",
			keys = "qwertyuiopzxcvbnmasdfghjkl",
			check_comma = true,
			highlight = "PmenuSel",
			highlight_grey = "LineNr",
		},
	})

  -- use these for Latex editing?
  -- autopairs.add_rule(Rule("$$", "$$", "tex"))

  -- autopairs.add_rules {
  --   Rule("$", "$", { "tex", "latex" }) -- don't add a pair if the next character is %
  --     :with_pair(cond.not_after_regex_check "%%") -- don't add a pair if  the previous character is xxx
  --     :with_pair(cond.not_before_regex_check("xxx", 3)) -- don't move right when repeat character
  --     :with_move(cond.none()) -- don't delete if the next character is xx
  --     :with_del(cond.not_after_regex_check "xx") -- disable  add newline when press <cr>
  --     :with_cr(cond.none()),
  -- }

  -- autopairs.add_rules {
  --   Rule("$$", "$$", "tex"):with_pair(function(opts)
  --     print(vim.inspect(opts))
  --     if opts.line == "aa $$" then
  --       -- don't add pair on that line
  --       return false
  --     end
  --   end),
  -- }

	local cmp_status_ok, cmp = pcall(require, "cmp")
	if cmp_status_ok then
    -- If you want insert `(` after select function or method item
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp_status_ok, cmp = pcall(require, "cmp")
		if not cmp_status_ok then
			return
		end
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
	else
		print("error: cannot call cmp while configuring autopairs")
	end

  -- TODO: use these?
  -- local ts_conds = require "nvim-autopairs.ts-conds"
  --
  -- -- TODO: can these rules be safely added from "config.lua" ?
  -- -- press % => %% is only inside comment or string
  -- autopairs.add_rules {
  --   Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
  --   Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
  -- }
end

M.configure()

return M
