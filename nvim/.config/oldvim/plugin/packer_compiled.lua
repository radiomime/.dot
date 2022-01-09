-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nƒ\1\0\1\6\0\n\0\r6\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\4B\2\2\1K\0\1\0\rmappings\1\0\3\rextended\1\nextra\2\nbasic\2\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\1\0\2\fpadding\2\vsticky\2\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\nœ\3\0\1\4\0\b\0\t6\1\0\0009\1\1\0015\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2=\2\2\1K\0\1\0\17exclude_name\1\2\0\0\17package.json\15exclude_ft\1\2\0\0\15javascript\1\0\18\rclosable\2\rtabpages\2\14auto_hide\1\14animation\2\20maximum_padding\3\1\fletters:asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP\21semantic_letters\2\19maximum_length\3\30\nicons\2\20insert_at_start\1\18insert_at_end\1\16icon_pinned\bÔ§Ç\28icon_close_tab_modified\b‚óè\19icon_close_tab\bÔôï\28icon_separator_inactive\b‚ñé\26icon_separator_active\b‚ñé\23icon_custom_colors\1\14clickable\2\15bufferline\6g\bvim\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n∂\15\0\1\a\0 \0#6\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\14\0005\5\4\0005\6\3\0=\6\5\0055\6\6\0=\6\a\0055\6\b\0=\6\t\0055\6\n\0=\6\v\0055\6\f\0=\6\r\5=\5\15\0045\5\16\0005\6\17\0=\6\18\0055\6\19\0=\6\20\5=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\0045\5\30\0=\5\31\4B\2\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\nstyle\fminimal\vborder\vsingle\rrelative\vcursor\brow\3\0\bcol\3\1&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\4\18virt_text_pos\beol\14virt_text\2\22ignore_whitespace\1\ndelay\3Ë\a\17watch_gitdir\1\0\2\rinterval\3Ë\a\17follow_files\2\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\r\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hb9<cmd>lua require\"gitsigns\".blame_line{full=true}<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hU8<cmd>lua require\"gitsigns\".reset_buffer_index()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17n <leader>hS2<cmd>lua require\"gitsigns\".stage_buffer()<CR>\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\nsigns\1\0\t\vlinehl\1\nnumhl\1\20max_file_length\3¿∏\2\14word_diff\1\20update_debounce\3d\18sign_priority\3\6\24attach_to_untracked\2\15signcolumn\2\23current_line_blame\1\17changedelete\1\0\4\ttext\b‚ñé\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\bÔ§â\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\bÔ§â\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\b‚ñé\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\b‚ñé\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n¢\5\0\1\t\0\"\00036\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\t\0005\5\3\0005\6\4\0=\6\5\0055\6\6\0=\6\a\0054\6\0\0=\6\b\5=\5\n\0045\5\f\0005\6\v\0=\6\r\0055\6\14\0005\a\15\0005\b\16\0=\b\17\a>\a\3\6=\6\18\0055\6\19\0=\6\20\0055\6\21\0=\6\22\0055\6\23\0=\6\24\0055\6\25\0=\6\26\5=\5\27\0045\5\28\0004\6\0\0=\6\r\0054\6\0\0=\6\18\0055\6\29\0=\6\20\0055\6\30\0=\6\22\0054\6\0\0=\6\24\0054\6\0\0=\6\26\5=\5\31\0044\5\0\0=\5 \0044\5\0\0=\5!\4B\2\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\fsources\1\3\0\0\rnvim_lsp\bcoc\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\bÓÇ≤\tleft\bÓÇ∞\25component_separators\1\0\2\nright\bÓÇ≥\tleft\bÓÇ±\1\0\3\25always_divide_middle\2\ntheme\tauto\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nT\0\1\6\0\5\0\f6\1\0\0006\3\1\0009\3\2\3\18\5\0\0B\3\2\0A\1\0\0019\1\3\0\a\1\4\0X\1\2Ä+\1\1\0L\1\2\0K\0\1\0\naa $$\tline\finspect\bvim\nprintΩ\b\1\1\16\0001\2á\0016\1\0\0'\3\1\0B\1\2\0026\2\0\0'\4\2\0B\2\2\0026\3\0\0'\5\3\0B\3\2\0029\4\4\0015\6\5\0005\a\a\0005\b\6\0=\b\b\a5\b\t\0=\b\n\a=\a\v\6B\4\2\0019\4\f\1\18\6\2\0'\b\r\0'\t\r\0'\n\14\0B\6\4\0A\4\0\0019\4\15\0014\6\3\0\18\a\2\0'\t\16\0'\n\16\0005\v\17\0B\a\4\2\18\t\a\0009\a\18\a9\n\19\3'\f\20\0B\n\2\0A\a\1\2\18\t\a\0009\a\18\a9\n\21\3'\f\22\0)\r\3\0B\n\3\0A\a\1\2\18\t\a\0009\a\23\a9\n\24\3B\n\1\0A\a\1\2\18\t\a\0009\a\25\a9\n\19\3'\f\26\0B\n\2\0A\a\1\2\18\t\a\0009\a\27\a9\n\24\3B\n\1\0A\a\1\0?\a\0\0B\4\2\0019\4\15\0014\6\3\0\18\a\2\0'\t\r\0'\n\r\0'\v\14\0B\a\4\2\18\t\a\0009\a\18\a3\n\28\0B\a\3\0?\a\0\0B\4\2\0016\4\29\0006\6\0\0'\a\30\0B\4\3\3\15\0\4\0X\6\14Ä6\6\0\0'\b\31\0B\6\2\0025\a \0009\b!\5\18\n\b\0009\b\"\b'\v#\0009\f$\0065\14%\0006\15&\0=\15&\14B\f\2\0A\b\2\0016\6\0\0'\b'\0B\6\2\0029\6\4\0065\b)\0005\t(\0=\t*\bB\6\2\0016\6\0\0'\b+\0B\6\2\0029\a\15\0014\t\3\0\18\n\2\0'\f,\0'\r,\0'\14\b\0B\n\4\2\18\f\n\0009\n\18\n9\r-\0065\15.\0B\r\2\0A\n\1\2>\n\1\t\18\n\2\0'\f\16\0'\r\16\0'\14\b\0B\n\4\2\18\f\n\0009\n\18\n9\r/\0065\0150\0B\r\2\0A\n\1\0?\n\1\0B\a\2\1K\0\1\0\1\2\0\0\rfunction\19is_not_ts_node\1\3\0\0\vstring\fcomment\15is_ts_node\6%\28nvim-autopairs.ts-conds\14autopairs\1\0\0\1\0\1\venable\2\28nvim-treesitter.configs\rmap_char\1\0\0\20on_confirm_done\17confirm_done\aon\nevent\1\0\2\btex\6{\ball\6(\"nvim-autopairs.completion.cmp\bcmp\npcall\0\fwith_cr\axx\rwith_del\tnone\14with_move\bxxx\27not_before_regex_check\a%%\26not_after_regex_check\14with_pair\1\3\0\0\btex\nlatex\6$\14add_rules\btex\a$$\radd_rule\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\1\rcheck_ts\2\nsetup\25nvim-autopairs.conds\24nvim-autopairs.rule\19nvim-autopairs\frequire\3ÄÄ¿ô\4\5ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireù\6\1\1\15\0.\0^6\1\0\0006\3\1\0'\4\2\0B\1\3\3\14\0\1\0X\3\2Ä2\0UÄX\3\3Ä6\3\3\0'\5\4\0B\3\2\0016\3\0\0006\5\1\0'\6\5\0B\3\3\3\14\0\3\0X\5\2Ä2\0KÄX\5\3Ä6\5\3\0'\a\6\0B\5\2\0016\5\1\0'\a\2\0B\5\2\0029\6\a\0055\b\v\0005\t\t\0003\n\b\0=\n\n\t=\t\f\b5\t\15\0009\n\r\0059\n\14\nB\n\1\2=\n\16\t9\n\r\0059\n\17\nB\n\1\2=\n\18\t9\n\r\0059\n\19\n)\f¸ˇB\n\2\2=\n\20\t9\n\r\0059\n\19\n)\f\4\0B\n\2\2=\n\21\t9\n\r\0059\f\r\0059\f\22\fB\f\1\0025\r\23\0B\n\3\2=\n\24\t9\n\r\0055\f\26\0009\r\r\0059\r\25\rB\r\1\2=\r\27\f9\r\r\0059\r\28\rB\r\1\2=\r\29\fB\n\2\2=\n\30\t9\n\r\0059\n\31\n5\f \0B\n\2\2=\n!\t9\n\"\0059\n#\n=\n$\t=\t\r\b4\t\3\0005\n%\0>\n\1\t5\n&\0>\n\2\t=\t'\b5\t)\0005\n(\0=\n*\t=\t+\b5\t,\0=\t-\bB\6\2\1K\0\1\0K\0\1\0K\0\1\0\15completion\1\0\1\19keyword_length\3\0\18documentation\vborder\1\0\0\1\t\0\0\b‚ï≠\b‚îÄ\b‚ïÆ\b‚îÇ\b‚ïØ\b‚îÄ\b‚ï∞\b‚îÇ\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<C-y>\fdisable\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-j>\21select_next_item\n<C-k>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup luasnip loaded okay for cmp\fluasnip\20cmp loaded okay\nprint\bcmp\frequire\npcall\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÄ\r\0\1\b\0:\0m6\1\0\0009\1\1\1)\2\0\0=\2\2\0016\1\0\0009\1\1\1)\2\0\0=\2\3\0016\1\0\0009\1\1\1)\2\0\0=\2\4\0016\1\0\0009\1\1\1)\2\1\0=\2\5\0016\1\0\0009\1\1\1)\2\0\0=\2\6\0016\1\0\0009\1\1\1'\2\b\0=\2\a\0016\1\0\0009\1\1\1)\2\0\0=\2\t\0016\1\0\0009\1\1\1)\2\0\0=\2\n\0016\1\0\0009\1\1\1)\2\0\0=\2\v\0016\1\0\0009\1\1\1'\2\r\0=\2\f\0016\1\0\0009\1\1\1'\2\15\0=\2\14\0016\1\0\0009\1\1\1)\2\1\0=\2\16\0016\1\0\0009\1\1\1)\2\1\0=\2\17\0016\1\0\0009\1\1\1)\2Ë\3=\2\18\0016\1\0\0009\1\1\0015\2\21\0005\3\20\0=\3\22\0025\3\23\0=\3\24\2=\2\19\0016\1\0\0009\1\1\0015\2\26\0=\2\25\0016\1\0\0009\1\1\0015\2\28\0005\3\29\0=\3\30\0025\3\31\0=\3 \2=\2\27\0016\1!\0'\3\"\0B\1\2\0029\2#\0015\4$\0004\5\0\0=\5%\0045\5&\0=\5'\0045\5(\0005\6)\0=\6*\5=\5+\0045\5,\0004\6\0\0=\6-\5=\5.\0045\5/\0004\6\0\0=\0060\5=\0051\0045\0052\0004\6\0\0=\0063\5=\0054\0045\0055\0005\0066\0004\a\0\0=\a7\6=\0068\5=\0059\4B\2\2\1K\0\1\0\tview\rmappings\tlist\1\0\1\16custom_only\1\1\0\4\tside\tleft\21hide_root_folder\1\nwidth\3\30\16auto_resize\2\ffilters\vcustom\1\0\1\rdotfiles\1\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\16diagnostics\nicons\1\0\4\fwarning\bÔÅ±\thint\bÔÅ™\tinfo\bÔÅö\nerror\bÔÅó\1\0\1\venable\2\22update_to_buf_dir\1\0\2\14auto_open\2\venable\2\23ignore_ft_on_setup\1\0\a\15update_cwd\2\18hijack_cursor\1\16open_on_tab\1\15auto_close\2\18open_on_setup\1\17hijack_netrw\1\18disable_netrw\1\nsetup\14nvim-tree\frequire\vfolder\1\0\b\15empty_open\bÔÑï\nempty\bÔÑî\fsymlink\bÔíÇ\17arrow_closed\bÔë†\17symlink_open\bÓóæ\15arrow_open\bÔëº\fdefault\bÓóø\topen\bÓóæ\bgit\1\0\a\vstaged\b‚úì\runstaged\b‚úó\fdeleted\bÔëò\fignored\b‚óå\14untracked\b‚òÖ\frenamed\b‚ûú\runmerged\bÓúß\1\0\2\fdefault\bÓòí\fsymlink\bÔíÅ\20nvim_tree_icons\1\0\4\nfiles\3\1\bgit\3\1\18folder_arrows\3\1\ffolders\3\1\25nvim_tree_show_icons\fbuftype\1\2\0\0\rterminal\rfiletype\1\0\0\1\4\0\0\vnotify\vpacker\aqf$nvim_tree_window_picker_exclude\27nvim_tree_refresh_wait&nvim_tree_create_in_closed_folder\30nvim_tree_respect_buf_cwd\n ‚ûõ \28nvim_tree_symlink_arrow\6 \27nvim_tree_icon_padding$nvim_tree_disable_window_picker\26nvim_tree_group_empty\27nvim_tree_add_trailing\a:t#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\29nvim_tree_indent_markers\27nvim_tree_quit_on_open\24nvim_tree_gitignore\6g\bvim\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n⁄\b\0\1\b\0&\00076\1\0\0006\3\1\0'\4\2\0B\1\3\3\14\0\1\0X\3\5Ä6\3\3\0'\5\4\0B\3\2\1K\0\1\0X\3\3Ä6\3\3\0'\5\5\0B\3\2\0016\3\1\0'\5\2\0B\3\2\0029\3\6\0035\5\a\0005\6\b\0004\a\0\0=\a\t\6=\6\n\0055\6\v\0005\a\f\0=\a\t\6=\6\r\0055\6\14\0005\a\15\0=\a\16\6=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\0055\6\23\0005\a\22\0=\a\24\0065\a\25\0=\a\26\6=\6\27\0055\6\28\0005\a\29\0=\a\30\6=\6\31\0055\6 \0004\a\0\0=\a\t\0065\a!\0=\a\"\6=\6#\0055\6$\0=\6%\5B\3\2\1K\0\1\0\frainbow\1\0\3\venable\1\19max_file_lines\3Ë\a\18extended_mode\2\15playground\16keybindings\1\0\n\14goto_node\t<cr>\14show_help\6?\vupdate\6R\21unfocus_language\6F\19focus_language\6f\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\1\0\3\venable\1\15updatetime\3\25\20persist_queries\1\17textsubjects\fkeymaps\1\0\2\6;\21textsubjects-big\6.\23textsubjects-smart\1\0\1\venable\1\16textobjects\vselect\1\0\1\venable\1\tswap\1\0\0\1\0\1\venable\1\fautotag\1\0\1\venable\1\fmatchup\1\0\1\venable\1\26context_commentstring\vconfig\1\0\a\thtml\16<!-- %s -->\tscss\r/* %s */\bcss\r/* %s */\tjson\5\15typescript\n// %s\bvue\16<!-- %s -->\vsvelte\16<!-- %s -->\1\0\1\venable\2\vindent\1\4\0\0\vpython\thtml\15javascript\1\0\1\venable\2\14highlight\fdisable\1\0\2&additional_vim_regex_highlighting\2\venable\2\1\0\2\17sync_install\1\21ensure_installed\15maintained\nsetup,treesitter configs successfully loading\29error loading treesitter\nprint\28nvim-treesitter.configs\frequire\npcall\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n≠\2\0\1\b\0\15\0\0216\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0044\5\0\0=\5\b\0044\5\0\0=\5\t\0046\5\n\0009\5\v\0059\5\f\5'\a\r\0B\5\2\2=\5\14\4B\2\2\1K\0\1\0\rdatapath\tdata\fstdpath\afn\bvim\17exclude_dirs\15ignore_lsp\rpatterns\1\b\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\22detection_methods\1\2\0\0\fpattern\1\0\3\17silent_chdir\2\16show_hidden\1\16manual_mode\1\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["structlog.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/structlog.nvim",
    url = "https://github.com/Tastyep/structlog.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÚ\v\0\1\v\0=\0Ä\0016\1\0\0'\3\1\0B\1\2\0029\1\2\0015\0037\0005\4\3\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\5=\5\t\0046\5\0\0'\a\n\0B\5\2\0029\5\v\5=\5\f\0045\5\r\0=\5\14\0046\5\0\0'\a\n\0B\5\2\0029\5\15\5=\5\16\0045\5\17\0=\5\18\0044\5\0\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0046\5\0\0'\a\24\0B\5\2\0029\5\25\0059\5\26\5=\5\27\0046\5\0\0'\a\24\0B\5\2\0029\5\28\0059\5\26\5=\5\29\0046\5\0\0'\a\24\0B\5\2\0029\5\30\0059\5\26\5=\5\31\0045\0052\0005\6\"\0006\a\0\0'\t \0B\a\2\0029\a!\a=\a#\0066\a\0\0'\t \0B\a\2\0029\a$\a=\a%\0066\a\0\0'\t \0B\a\2\0029\a&\a=\a'\0066\a\0\0'\t \0B\a\2\0029\a(\a=\a)\0066\a\0\0'\t \0B\a\2\0029\a*\a=\a+\0066\a\0\0'\t \0B\a\2\0029\a,\a6\b\0\0'\n \0B\b\2\0029\b-\b \a\b\a=\a.\0066\a\0\0'\t \0B\a\2\0029\a/\a6\b\0\0'\n \0B\b\2\0029\b0\b \a\b\a=\a1\6=\0063\0055\0064\0006\a\0\0'\t \0B\a\2\0029\a!\a=\a#\0066\a\0\0'\t \0B\a\2\0029\a$\a=\a%\0066\a\0\0'\t \0B\a\2\0029\a,\a6\b\0\0'\n \0B\b\2\0029\b-\b \a\b\a=\a.\6=\0065\5=\0056\4=\0048\0035\4:\0005\0059\0=\5;\4=\4<\3B\1\2\1K\0\1\0\15extensions\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\t<CR>\vcenter\19select_default\n<C-q>\16open_qflist\25smart_send_to_qflist\n<C-k>\23cycle_history_prev\n<C-j>\23cycle_history_next\n<C-c>\nclose\n<C-p>\28move_selection_previous\n<C-n>\1\0\0\24move_selection_next\22telescope.actions\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\vborder\17path_display\1\0\1\fshorten\3\5\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\1\2\0\0\17node_modules\16file_sorter\19get_fzy_sorter\22telescope.sorters\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\1\vmirror\1\1\0\3\20prompt_position\vbottom\nwidth\4\0ÄÄ†ˇ\3\19preview_cutoff\3x\1\0\n\17entry_prefix\a  \19color_devicons\2\18prompt_prefix\tÔë´ \rwinblend\3\0\ruse_less\2\20selection_caret\tÔÅ§ \20layout_strategy\15horizontal\21sorting_strategy\15descending\23selection_strategy\nreset\17initial_mode\vinsert\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nê\3\0\1\a\1\r\0\0206\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\3\0004\5\0\0=\5\4\0046\5\5\0009\5\6\0059\5\a\5=\5\a\0045\5\b\0005\6\t\0=\6\n\5=\5\v\4B\2\2\1-\2\0\0009\2\f\2B\2\1\1K\0\1\0\0¿\21create_terminals\15float_opts\15highlights\1\0\2\vborder\vNormal\15background\vNormal\1\0\2\rwinblend\3\0\vborder\vcurved\nshell\6o\bvim\20shade_filetypes\1\0\n\tsize\3\20\18close_on_exit\2\17persist_size\1\20insert_mappings\2\20start_in_insert\2\19shading_factor\3\3\20shade_terminals\2\17hide_numbers\2\14direction\nfloat\17open_mapping\n<c-t>\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n¶2\0\1\b\0•\1\0Á\0016\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\b\0005\5\3\0005\6\4\0=\6\5\0055\6\6\0=\6\a\5=\5\t\0045\5\n\0=\5\v\0044\5\0\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0005\6\18\0=\6\19\0055\6\20\0=\6\21\5=\5\22\0045\5\24\0005\6\23\0=\6\25\0055\6\26\0=\6\27\5=\5\28\0045\5\29\0=\5\30\0045\5 \0005\6\31\0=\6!\0055\6\"\0=\6#\5=\5$\4B\2\2\0019\2%\0015\4'\0005\5&\0=\5(\0045\5)\0=\5*\0045\5+\0=\5,\0045\5-\0=\5.\0045\5/\0=\0050\0045\0051\0=\0052\0045\0053\0=\0054\0045\0055\0=\5#\0045\0056\0=\0057\0045\0058\0005\0069\0=\0062\0055\6:\0=\6;\0055\6<\0=\6=\0055\6>\0=\0060\0055\6?\0=\0067\0055\6@\0=\6A\0055\6B\0=\6C\0055\6D\0=\6E\0055\6F\0=\6G\0055\6H\0=\6I\0055\6J\0=\6K\0055\6L\0=\6M\5=\5N\0045\5O\0005\6P\0=\6Q\0055\6R\0=\0062\0055\6S\0=\6(\0055\6T\0=\6U\0055\6V\0=\0067\0055\6W\0=\6X\0055\6Y\0=\6Z\0055\6[\0=\6\\\5=\5=\0045\5]\0005\6^\0=\0060\0055\6_\0=\6!\0055\6`\0=\6C\0055\6a\0=\6N\0055\6b\0=\6c\0055\6d\0=\6e\5=\5M\0045\5f\0005\6g\0=\6h\0055\6i\0=\6Q\0055\6j\0=\6I\0055\6k\0=\6X\0055\6l\0=\6M\0055\6m\0=\6C\0055\6n\0=\6E\0055\6o\0=\6N\0055\6p\0=\6e\0055\6q\0=\6r\0055\6s\0=\6=\0055\6t\0=\0060\0055\6u\0=\6K\5=\5h\0045\5v\0005\6w\0=\6x\0055\6y\0=\6;\0055\6z\0=\6(\0055\6{\0=\0062\0055\6|\0=\6!\0055\6}\0=\6Q\0055\6~\0=\6I\0055\6\0005\aÄ\0=\a;\0065\aÅ\0=\aG\0065\aÇ\0=\a!\6=\6M\0055\6É\0=\6*\0055\6Ñ\0=\6C\0055\6Ö\0=\6N\0055\6Ü\0=\6c\5=\5X\0045\5á\0005\6à\0=\6Q\0055\6â\0=\6h\5=\5Q\0045\5ä\0005\6ã\0=\0060\0055\6å\0=\0062\0055\6ç\0=\6h\0055\6é\0=\6I\0055\6è\0=\6!\0055\6ê\0005\aë\0=\a;\0065\aí\0=\aZ\0065\aì\0=\aî\0065\aï\0=\añ\0065\aó\0=\aX\0065\aò\0=\a\\\0065\aô\0=\aM\0065\aö\0=\aõ\6=\6X\5=\5\\\0045\5ú\0005\6ù\0=\6G\5=\5G\0045\5û\0005\6ü\0=\6!\5=\5†\0045\5°\0B\2\3\0019\2%\0015\4£\0005\5¢\0=\5,\0045\5§\0B\2\3\1K\0\1\0\1\0\5\vnowait\2\vsilent\2\fnoremap\2\vprefix\r<leader>\tmode\6v\1\0\0\1\3\0\0\23:CommentToggle<CR>\fComment\1\0\5\vnowait\2\vsilent\2\fnoremap\2\vprefix\r<leader>\tmode\6n\6T\1\3\0\0\22:TSConfigInfo<cr>\tInfo\1\0\1\tname\15Treesitter\1\3\0\0\24:NvimTreeToggle<cr>\vToggle\1\0\1\tname\rnvimtree\6P\1\3\0\0000<cmd>edit ~/.cache/nvim/packer.nvim.log<cr>\28Open the Packer logfile\1\3\0\0I<cmd>lua require('core.terminal').toggle_log_view('packer.nvim')<cr>\20view packer log\1\3\0\0(<cmd>edit ~/.cache/nvim/lsp.log<cr>\25Open the LSP logfile\1\3\0\0B<cmd>lua require('core.terminal').toggle_log_view('nvim')<cr>\20view neovim log\6N\1\3\0\0$<cmd>edit ~/.cache/nvim/log<cr>\28Open the Neovim logfile\6n\1\3\0\0A<cmd>lua require('core.terminal').toggle_log_view('lsp')<cr>\17view lsp log\1\3\0\0-<cmd>edit ~/.cache/nvim/lunarvim.log<cr>\29Open the default logfile\1\3\0\0F<cmd>lua require('core.terminal').toggle_log_view('lunarvim')<cr>\21view default log\1\0\1\tname\n+logs\1\3\0\0D<cmd>lua require('core.info').toggle_popup(vim.bo.filetype)<cr>\25Toggle LunarVim Info\1\3\0\0000<cmd>lua require('keymappings').print()<cr>(View LunarVim's default keymappings\1\3\0\0A<cmd>lua require('core.telescope').grep_lunarvim_files()<cr>\24Grep LunarVim files\1\3\0\0A<cmd>lua require('core.telescope').find_lunarvim_files()<cr>\24Find LunarVim files\1\3\0\0,<cmd>edit ~/.config/nvim/config.lua<cr>\20Edit config.lua\1\0\1\tname\14+LunarVim\1\3\0\0004<cmd>lua require('core.terminal').lazygit()<cr>\24Git status terminal\1\3\0\0\24<cmd>ToggleTerm<cr>\29Toggle floating terminal\1\0\1\tname\rterminal\1\3\0\0005<cmd>Telescope lsp_dynamic_workspace_symbols<cr>\22Workspace Symbols\1\3\0\0,<cmd>Telescope lsp_document_symbols<cr>\21Document Symbols\1\3\0\0&<cmd>lua vim.lsp.buf.rename()<cr>\vRename\1\3\0\0002<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>\rQuickfix\1\3\0\0<<cmd>lua require('lsp.peek').Peek('implementation')<cr>\19Implementation\1\3\0\0<<cmd>lua require('lsp.peek').Peek('typeDefinition')<cr>\20Type Definition\1\3\0\0008<cmd>lua require('lsp.peek').Peek('definition')<cr>\15Definition\1\0\1\tname\tPeek\1\3\0\0^<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = neo.lsp.popup_border}})<cr>\20Prev Diagnostic\1\3\0\0^<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = neo.lsp.popup_border}})<cr>\20Next Diagnostic\1\3\0\0\21<cmd>LspInfo<cr>\tInfo\1\3\0\0*<cmd>lua vim.lsp.buf.formatting()<cr>\vFormat\1\3\0\0001<cmd>Telescope lsp_workspace_diagnostics<cr>\26Workspace Diagnostics\1\3\0\0000<cmd>Telescope lsp_document_diagnostics<cr>\25Document Diagnostics\6a\1\3\0\0+<cmd>lua vim.lsp.buf.code_action()<cr>\16Code Action\1\0\1\tname\bLSP\1\3\0\0$<cmd>Telescope git_bcommits<cr>&Checkout commit(for current file)\1\3\0\0#<cmd>Telescope git_commits<cr>\20Checkout commit\1\3\0\0$<cmd>Telescope git_branches<cr>\20Checkout branch\6o\1\3\0\0\"<cmd>Telescope git_status<cr>\22Open changed file\1\3\0\0006<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>\20Undo Stage Hunk\1\3\0\0001<cmd>lua require 'gitsigns'.stage_hunk()<cr>\15Stage Hunk\1\3\0\0003<cmd>lua require 'gitsigns'.reset_buffer()<cr>\17Reset Buffer\1\3\0\0001<cmd>lua require 'gitsigns'.reset_hunk()<cr>\15Reset Hunk\1\3\0\0003<cmd>lua require 'gitsigns'.preview_hunk()<cr>\17Preview Hunk\1\3\0\0001<cmd>lua require 'gitsigns'.blame_line()<cr>\nBlame\1\3\0\0000<cmd>lua require 'gitsigns'.prev_hunk()<cr>\14Prev Hunk\1\3\0\0000<cmd>lua require 'gitsigns'.next_hunk()<cr>\14Next Hunk\6g\1\3\0\0A<cmd>lua require('plugins.toggleterm')._lazygit_toggle()<cr>\fLazyGit\1\0\1\tname\bGit\6u\1\3\0\0\26<cmd>PackerUpdate<cr>\vUpdate\6S\1\3\0\0\26<cmd>PackerStatus<cr>\vStatus\1\3\0\0\24<cmd>PackerSync<cr>\tSync\1\3\0\0005<cmd>lua require('utils').reload_lv_config()<cr>\vReload\1\3\0\0\27<cmd>PackerInstall<cr>\fInstall\1\3\0\0\27<cmd>PackerCompile<cr>\fCompile\1\0\1\tname\vPacker\6L\1\3\0\0#<cmd>BufferOrderByLanguage<cr>/sort BufferLines automatically by language\6D\1\3\0\0$<cmd>BufferOrderByDirectory<cr>0sort BufferLines automatically by directory\6l\1\3\0\0%<cmd>BufferCloseBuffersRight<cr>'close all BufferLines to the right\1\3\0\0$<cmd>BufferCloseBuffersLeft<cr>\"close all buffers to the left\6e\1\3\0\0&<cmd>BufferCloseAllButCurrent<cr>!close all but current buffer\1\3\0\0\27<cmd>BufferWipeout<cr>\19wipeout buffer\1\3\0\0\31<cmd>Telescope buffers<cr>\16Find buffer\6j\1\3\0\0\24<cmd>BufferPick<cr>\19jump to buffer\1\0\1\tname\fBuffers\6s\6p\1\3\0\0\\<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>\29Colorscheme with Preview\6C\1\3\0\0 <cmd>Telescope commands<cr>\rCommands\6k\1\3\0\0\31<cmd>Telescope keymaps<cr>\fKeymaps\6t\1\3\0\0!<cmd>Telescope live_grep<cr>\tText\6R\1\3\0\0!<cmd>Telescope registers<cr>\14Registers\6r\1\3\0\0 <cmd>Telescope oldfiles<cr>\21Open Recent File\6M\1\3\0\0!<cmd>Telescope man_pages<cr>\14Man Pages\1\3\0\0!<cmd>Telescope help_tags<cr>\14Find Help\1\3\0\0#<cmd>Telescope colorscheme<cr>\16Colorscheme\6b\1\3\0\0$<cmd>Telescope git_branches<cr>\20Checkout branch\6d\1\3\0\0.<cmd>Telescope find_files hidden=true<cr>\24Find File (+hidden)\1\3\0\0\"<cmd>Telescope find_files<cr>\14Find File\1\0\1\tname\vSearch\6h\1\3\0\0\19<cmd>split<CR>\21Horizontal split\1\3\0\0\20<cmd>vsplit<CR>\19Vertical split\6z\1\3\0\0\21<cmd>ZenMode<CR>\rZen Mode\6f\1\3\0\0\"<cmd>Telescope find_files<CR>\14Find File\6c\1\3\0\0\26<cmd>BufferClose!<CR>\17Close Buffer\6;\1\3\0\0\23<cmd>Dashboard<CR>\14Dashboard\6/\1\3\0\0\27<cmd>CommentToggle<CR>\fComment\6q\1\3\0\0\16<cmd>q!<CR>\tQuit\6w\1\0\0\1\3\0\0\16<cmd>w!<CR>\tSave\rregister\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmin\3\20\bmax\0032\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmin\3\4\bmax\3\25\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rwinblend\3\0\vborder\vdouble\rposition\btop\19popup_mappings\1\0\2\16scroll_down\n<c-d>\14scroll_up\n<c-u>\nicons\1\0\3\14separator\b‚ûú\ngroup\6+\15breadcrumb\a¬ª\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\3\19ignore_missing\1\14show_help\2\rtriggers\tauto\fpresets\1\0\a\17text_objects\2\fmotions\2\14operators\2\6g\2\6z\2\bnav\2\fwindows\2\rspelling\1\0\2\16suggestions\3\20\fenabled\2\1\0\2\nmarks\2\14registers\2\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/matt/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireù\6\1\1\15\0.\0^6\1\0\0006\3\1\0'\4\2\0B\1\3\3\14\0\1\0X\3\2Ä2\0UÄX\3\3Ä6\3\3\0'\5\4\0B\3\2\0016\3\0\0006\5\1\0'\6\5\0B\3\3\3\14\0\3\0X\5\2Ä2\0KÄX\5\3Ä6\5\3\0'\a\6\0B\5\2\0016\5\1\0'\a\2\0B\5\2\0029\6\a\0055\b\v\0005\t\t\0003\n\b\0=\n\n\t=\t\f\b5\t\15\0009\n\r\0059\n\14\nB\n\1\2=\n\16\t9\n\r\0059\n\17\nB\n\1\2=\n\18\t9\n\r\0059\n\19\n)\f¸ˇB\n\2\2=\n\20\t9\n\r\0059\n\19\n)\f\4\0B\n\2\2=\n\21\t9\n\r\0059\f\r\0059\f\22\fB\f\1\0025\r\23\0B\n\3\2=\n\24\t9\n\r\0055\f\26\0009\r\r\0059\r\25\rB\r\1\2=\r\27\f9\r\r\0059\r\28\rB\r\1\2=\r\29\fB\n\2\2=\n\30\t9\n\r\0059\n\31\n5\f \0B\n\2\2=\n!\t9\n\"\0059\n#\n=\n$\t=\t\r\b4\t\3\0005\n%\0>\n\1\t5\n&\0>\n\2\t=\t'\b5\t)\0005\n(\0=\n*\t=\t+\b5\t,\0=\t-\bB\6\2\1K\0\1\0K\0\1\0K\0\1\0\15completion\1\0\1\19keyword_length\3\0\18documentation\vborder\1\0\0\1\t\0\0\b‚ï≠\b‚îÄ\b‚ïÆ\b‚îÇ\b‚ïØ\b‚îÄ\b‚ï∞\b‚îÇ\fsources\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\n<C-y>\fdisable\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-j>\21select_next_item\n<C-k>\1\0\0\21select_prev_item\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup luasnip loaded okay for cmp\fluasnip\20cmp loaded okay\nprint\bcmp\frequire\npcall\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n¢\5\0\1\t\0\"\00036\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\t\0005\5\3\0005\6\4\0=\6\5\0055\6\6\0=\6\a\0054\6\0\0=\6\b\5=\5\n\0045\5\f\0005\6\v\0=\6\r\0055\6\14\0005\a\15\0005\b\16\0=\b\17\a>\a\3\6=\6\18\0055\6\19\0=\6\20\0055\6\21\0=\6\22\0055\6\23\0=\6\24\0055\6\25\0=\6\26\5=\5\27\0045\5\28\0004\6\0\0=\6\r\0054\6\0\0=\6\18\0055\6\29\0=\6\20\0055\6\30\0=\6\22\0054\6\0\0=\6\24\0054\6\0\0=\6\26\5=\5\31\0044\5\0\0=\5 \0044\5\0\0=\5!\4B\2\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\fsources\1\3\0\0\rnvim_lsp\bcoc\1\2\0\0\16diagnostics\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\bÓÇ≤\tleft\bÓÇ∞\25component_separators\1\0\2\nright\bÓÇ≥\tleft\bÓÇ±\1\0\3\25always_divide_middle\2\ntheme\tauto\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n¶2\0\1\b\0•\1\0Á\0016\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\b\0005\5\3\0005\6\4\0=\6\5\0055\6\6\0=\6\a\5=\5\t\0045\5\n\0=\5\v\0044\5\0\0=\5\f\0045\5\r\0=\5\14\0045\5\15\0=\5\16\0045\5\17\0005\6\18\0=\6\19\0055\6\20\0=\6\21\5=\5\22\0045\5\24\0005\6\23\0=\6\25\0055\6\26\0=\6\27\5=\5\28\0045\5\29\0=\5\30\0045\5 \0005\6\31\0=\6!\0055\6\"\0=\6#\5=\5$\4B\2\2\0019\2%\0015\4'\0005\5&\0=\5(\0045\5)\0=\5*\0045\5+\0=\5,\0045\5-\0=\5.\0045\5/\0=\0050\0045\0051\0=\0052\0045\0053\0=\0054\0045\0055\0=\5#\0045\0056\0=\0057\0045\0058\0005\0069\0=\0062\0055\6:\0=\6;\0055\6<\0=\6=\0055\6>\0=\0060\0055\6?\0=\0067\0055\6@\0=\6A\0055\6B\0=\6C\0055\6D\0=\6E\0055\6F\0=\6G\0055\6H\0=\6I\0055\6J\0=\6K\0055\6L\0=\6M\5=\5N\0045\5O\0005\6P\0=\6Q\0055\6R\0=\0062\0055\6S\0=\6(\0055\6T\0=\6U\0055\6V\0=\0067\0055\6W\0=\6X\0055\6Y\0=\6Z\0055\6[\0=\6\\\5=\5=\0045\5]\0005\6^\0=\0060\0055\6_\0=\6!\0055\6`\0=\6C\0055\6a\0=\6N\0055\6b\0=\6c\0055\6d\0=\6e\5=\5M\0045\5f\0005\6g\0=\6h\0055\6i\0=\6Q\0055\6j\0=\6I\0055\6k\0=\6X\0055\6l\0=\6M\0055\6m\0=\6C\0055\6n\0=\6E\0055\6o\0=\6N\0055\6p\0=\6e\0055\6q\0=\6r\0055\6s\0=\6=\0055\6t\0=\0060\0055\6u\0=\6K\5=\5h\0045\5v\0005\6w\0=\6x\0055\6y\0=\6;\0055\6z\0=\6(\0055\6{\0=\0062\0055\6|\0=\6!\0055\6}\0=\6Q\0055\6~\0=\6I\0055\6\0005\aÄ\0=\a;\0065\aÅ\0=\aG\0065\aÇ\0=\a!\6=\6M\0055\6É\0=\6*\0055\6Ñ\0=\6C\0055\6Ö\0=\6N\0055\6Ü\0=\6c\5=\5X\0045\5á\0005\6à\0=\6Q\0055\6â\0=\6h\5=\5Q\0045\5ä\0005\6ã\0=\0060\0055\6å\0=\0062\0055\6ç\0=\6h\0055\6é\0=\6I\0055\6è\0=\6!\0055\6ê\0005\aë\0=\a;\0065\aí\0=\aZ\0065\aì\0=\aî\0065\aï\0=\añ\0065\aó\0=\aX\0065\aò\0=\a\\\0065\aô\0=\aM\0065\aö\0=\aõ\6=\6X\5=\5\\\0045\5ú\0005\6ù\0=\6G\5=\5G\0045\5û\0005\6ü\0=\6!\5=\5†\0045\5°\0B\2\3\0019\2%\0015\4£\0005\5¢\0=\5,\0045\5§\0B\2\3\1K\0\1\0\1\0\5\vnowait\2\vsilent\2\fnoremap\2\vprefix\r<leader>\tmode\6v\1\0\0\1\3\0\0\23:CommentToggle<CR>\fComment\1\0\5\vnowait\2\vsilent\2\fnoremap\2\vprefix\r<leader>\tmode\6n\6T\1\3\0\0\22:TSConfigInfo<cr>\tInfo\1\0\1\tname\15Treesitter\1\3\0\0\24:NvimTreeToggle<cr>\vToggle\1\0\1\tname\rnvimtree\6P\1\3\0\0000<cmd>edit ~/.cache/nvim/packer.nvim.log<cr>\28Open the Packer logfile\1\3\0\0I<cmd>lua require('core.terminal').toggle_log_view('packer.nvim')<cr>\20view packer log\1\3\0\0(<cmd>edit ~/.cache/nvim/lsp.log<cr>\25Open the LSP logfile\1\3\0\0B<cmd>lua require('core.terminal').toggle_log_view('nvim')<cr>\20view neovim log\6N\1\3\0\0$<cmd>edit ~/.cache/nvim/log<cr>\28Open the Neovim logfile\6n\1\3\0\0A<cmd>lua require('core.terminal').toggle_log_view('lsp')<cr>\17view lsp log\1\3\0\0-<cmd>edit ~/.cache/nvim/lunarvim.log<cr>\29Open the default logfile\1\3\0\0F<cmd>lua require('core.terminal').toggle_log_view('lunarvim')<cr>\21view default log\1\0\1\tname\n+logs\1\3\0\0D<cmd>lua require('core.info').toggle_popup(vim.bo.filetype)<cr>\25Toggle LunarVim Info\1\3\0\0000<cmd>lua require('keymappings').print()<cr>(View LunarVim's default keymappings\1\3\0\0A<cmd>lua require('core.telescope').grep_lunarvim_files()<cr>\24Grep LunarVim files\1\3\0\0A<cmd>lua require('core.telescope').find_lunarvim_files()<cr>\24Find LunarVim files\1\3\0\0,<cmd>edit ~/.config/nvim/config.lua<cr>\20Edit config.lua\1\0\1\tname\14+LunarVim\1\3\0\0004<cmd>lua require('core.terminal').lazygit()<cr>\24Git status terminal\1\3\0\0\24<cmd>ToggleTerm<cr>\29Toggle floating terminal\1\0\1\tname\rterminal\1\3\0\0005<cmd>Telescope lsp_dynamic_workspace_symbols<cr>\22Workspace Symbols\1\3\0\0,<cmd>Telescope lsp_document_symbols<cr>\21Document Symbols\1\3\0\0&<cmd>lua vim.lsp.buf.rename()<cr>\vRename\1\3\0\0002<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>\rQuickfix\1\3\0\0<<cmd>lua require('lsp.peek').Peek('implementation')<cr>\19Implementation\1\3\0\0<<cmd>lua require('lsp.peek').Peek('typeDefinition')<cr>\20Type Definition\1\3\0\0008<cmd>lua require('lsp.peek').Peek('definition')<cr>\15Definition\1\0\1\tname\tPeek\1\3\0\0^<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = neo.lsp.popup_border}})<cr>\20Prev Diagnostic\1\3\0\0^<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = neo.lsp.popup_border}})<cr>\20Next Diagnostic\1\3\0\0\21<cmd>LspInfo<cr>\tInfo\1\3\0\0*<cmd>lua vim.lsp.buf.formatting()<cr>\vFormat\1\3\0\0001<cmd>Telescope lsp_workspace_diagnostics<cr>\26Workspace Diagnostics\1\3\0\0000<cmd>Telescope lsp_document_diagnostics<cr>\25Document Diagnostics\6a\1\3\0\0+<cmd>lua vim.lsp.buf.code_action()<cr>\16Code Action\1\0\1\tname\bLSP\1\3\0\0$<cmd>Telescope git_bcommits<cr>&Checkout commit(for current file)\1\3\0\0#<cmd>Telescope git_commits<cr>\20Checkout commit\1\3\0\0$<cmd>Telescope git_branches<cr>\20Checkout branch\6o\1\3\0\0\"<cmd>Telescope git_status<cr>\22Open changed file\1\3\0\0006<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>\20Undo Stage Hunk\1\3\0\0001<cmd>lua require 'gitsigns'.stage_hunk()<cr>\15Stage Hunk\1\3\0\0003<cmd>lua require 'gitsigns'.reset_buffer()<cr>\17Reset Buffer\1\3\0\0001<cmd>lua require 'gitsigns'.reset_hunk()<cr>\15Reset Hunk\1\3\0\0003<cmd>lua require 'gitsigns'.preview_hunk()<cr>\17Preview Hunk\1\3\0\0001<cmd>lua require 'gitsigns'.blame_line()<cr>\nBlame\1\3\0\0000<cmd>lua require 'gitsigns'.prev_hunk()<cr>\14Prev Hunk\1\3\0\0000<cmd>lua require 'gitsigns'.next_hunk()<cr>\14Next Hunk\6g\1\3\0\0A<cmd>lua require('plugins.toggleterm')._lazygit_toggle()<cr>\fLazyGit\1\0\1\tname\bGit\6u\1\3\0\0\26<cmd>PackerUpdate<cr>\vUpdate\6S\1\3\0\0\26<cmd>PackerStatus<cr>\vStatus\1\3\0\0\24<cmd>PackerSync<cr>\tSync\1\3\0\0005<cmd>lua require('utils').reload_lv_config()<cr>\vReload\1\3\0\0\27<cmd>PackerInstall<cr>\fInstall\1\3\0\0\27<cmd>PackerCompile<cr>\fCompile\1\0\1\tname\vPacker\6L\1\3\0\0#<cmd>BufferOrderByLanguage<cr>/sort BufferLines automatically by language\6D\1\3\0\0$<cmd>BufferOrderByDirectory<cr>0sort BufferLines automatically by directory\6l\1\3\0\0%<cmd>BufferCloseBuffersRight<cr>'close all BufferLines to the right\1\3\0\0$<cmd>BufferCloseBuffersLeft<cr>\"close all buffers to the left\6e\1\3\0\0&<cmd>BufferCloseAllButCurrent<cr>!close all but current buffer\1\3\0\0\27<cmd>BufferWipeout<cr>\19wipeout buffer\1\3\0\0\31<cmd>Telescope buffers<cr>\16Find buffer\6j\1\3\0\0\24<cmd>BufferPick<cr>\19jump to buffer\1\0\1\tname\fBuffers\6s\6p\1\3\0\0\\<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>\29Colorscheme with Preview\6C\1\3\0\0 <cmd>Telescope commands<cr>\rCommands\6k\1\3\0\0\31<cmd>Telescope keymaps<cr>\fKeymaps\6t\1\3\0\0!<cmd>Telescope live_grep<cr>\tText\6R\1\3\0\0!<cmd>Telescope registers<cr>\14Registers\6r\1\3\0\0 <cmd>Telescope oldfiles<cr>\21Open Recent File\6M\1\3\0\0!<cmd>Telescope man_pages<cr>\14Man Pages\1\3\0\0!<cmd>Telescope help_tags<cr>\14Find Help\1\3\0\0#<cmd>Telescope colorscheme<cr>\16Colorscheme\6b\1\3\0\0$<cmd>Telescope git_branches<cr>\20Checkout branch\6d\1\3\0\0.<cmd>Telescope find_files hidden=true<cr>\24Find File (+hidden)\1\3\0\0\"<cmd>Telescope find_files<cr>\14Find File\1\0\1\tname\vSearch\6h\1\3\0\0\19<cmd>split<CR>\21Horizontal split\1\3\0\0\20<cmd>vsplit<CR>\19Vertical split\6z\1\3\0\0\21<cmd>ZenMode<CR>\rZen Mode\6f\1\3\0\0\"<cmd>Telescope find_files<CR>\14Find File\6c\1\3\0\0\26<cmd>BufferClose!<CR>\17Close Buffer\6;\1\3\0\0\23<cmd>Dashboard<CR>\14Dashboard\6/\1\3\0\0\27<cmd>CommentToggle<CR>\fComment\6q\1\3\0\0\16<cmd>q!<CR>\tQuit\6w\1\0\0\1\3\0\0\16<cmd>w!<CR>\tSave\rregister\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmin\3\20\bmax\0032\vheight\1\0\2\fspacing\3\3\nalign\tleft\1\0\2\bmin\3\4\bmax\3\25\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\3\rwinblend\3\0\vborder\vdouble\rposition\btop\19popup_mappings\1\0\2\16scroll_down\n<c-d>\14scroll_up\n<c-u>\nicons\1\0\3\14separator\b‚ûú\ngroup\6+\15breadcrumb\a¬ª\15key_labels\14operators\1\0\1\agc\rComments\fplugins\1\0\3\19ignore_missing\1\14show_help\2\rtriggers\tauto\fpresets\1\0\a\17text_objects\2\fmotions\2\14operators\2\6g\2\6z\2\bnav\2\fwindows\2\rspelling\1\0\2\16suggestions\3\20\fenabled\2\1\0\2\nmarks\2\14registers\2\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÚ\v\0\1\v\0=\0Ä\0016\1\0\0'\3\1\0B\1\2\0029\1\2\0015\0037\0005\4\3\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\5=\5\t\0046\5\0\0'\a\n\0B\5\2\0029\5\v\5=\5\f\0045\5\r\0=\5\14\0046\5\0\0'\a\n\0B\5\2\0029\5\15\5=\5\16\0045\5\17\0=\5\18\0044\5\0\0=\5\19\0045\5\20\0=\5\21\0045\5\22\0=\5\23\0046\5\0\0'\a\24\0B\5\2\0029\5\25\0059\5\26\5=\5\27\0046\5\0\0'\a\24\0B\5\2\0029\5\28\0059\5\26\5=\5\29\0046\5\0\0'\a\24\0B\5\2\0029\5\30\0059\5\26\5=\5\31\0045\0052\0005\6\"\0006\a\0\0'\t \0B\a\2\0029\a!\a=\a#\0066\a\0\0'\t \0B\a\2\0029\a$\a=\a%\0066\a\0\0'\t \0B\a\2\0029\a&\a=\a'\0066\a\0\0'\t \0B\a\2\0029\a(\a=\a)\0066\a\0\0'\t \0B\a\2\0029\a*\a=\a+\0066\a\0\0'\t \0B\a\2\0029\a,\a6\b\0\0'\n \0B\b\2\0029\b-\b \a\b\a=\a.\0066\a\0\0'\t \0B\a\2\0029\a/\a6\b\0\0'\n \0B\b\2\0029\b0\b \a\b\a=\a1\6=\0063\0055\0064\0006\a\0\0'\t \0B\a\2\0029\a!\a=\a#\0066\a\0\0'\t \0B\a\2\0029\a$\a=\a%\0066\a\0\0'\t \0B\a\2\0029\a,\a6\b\0\0'\n \0B\b\2\0029\b-\b \a\b\a=\a.\6=\0065\5=\0056\4=\0048\0035\4:\0005\0059\0=\5;\4=\4<\3B\1\2\1K\0\1\0\15extensions\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\t<CR>\vcenter\19select_default\n<C-q>\16open_qflist\25smart_send_to_qflist\n<C-k>\23cycle_history_prev\n<C-j>\23cycle_history_next\n<C-c>\nclose\n<C-p>\28move_selection_previous\n<C-n>\1\0\0\24move_selection_next\22telescope.actions\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\vborder\17path_display\1\0\1\fshorten\3\5\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\1\2\0\0\17node_modules\16file_sorter\19get_fzy_sorter\22telescope.sorters\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\1\vmirror\1\1\0\3\20prompt_position\vbottom\nwidth\4\0ÄÄ†ˇ\3\19preview_cutoff\3x\1\0\n\17entry_prefix\a  \19color_devicons\2\18prompt_prefix\tÔë´ \rwinblend\3\0\ruse_less\2\20selection_caret\tÔÅ§ \20layout_strategy\15horizontal\21sorting_strategy\15descending\23selection_strategy\nreset\17initial_mode\vinsert\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nê\3\0\1\a\1\r\0\0206\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\3\0004\5\0\0=\5\4\0046\5\5\0009\5\6\0059\5\a\5=\5\a\0045\5\b\0005\6\t\0=\6\n\5=\5\v\4B\2\2\1-\2\0\0009\2\f\2B\2\1\1K\0\1\0\0¿\21create_terminals\15float_opts\15highlights\1\0\2\vborder\vNormal\15background\vNormal\1\0\2\rwinblend\3\0\vborder\vcurved\nshell\6o\bvim\20shade_filetypes\1\0\n\tsize\3\20\18close_on_exit\2\17persist_size\1\20insert_mappings\2\20start_in_insert\2\19shading_factor\3\3\20shade_terminals\2\17hide_numbers\2\14direction\nfloat\17open_mapping\n<c-t>\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nT\0\1\6\0\5\0\f6\1\0\0006\3\1\0009\3\2\3\18\5\0\0B\3\2\0A\1\0\0019\1\3\0\a\1\4\0X\1\2Ä+\1\1\0L\1\2\0K\0\1\0\naa $$\tline\finspect\bvim\nprintΩ\b\1\1\16\0001\2á\0016\1\0\0'\3\1\0B\1\2\0026\2\0\0'\4\2\0B\2\2\0026\3\0\0'\5\3\0B\3\2\0029\4\4\0015\6\5\0005\a\a\0005\b\6\0=\b\b\a5\b\t\0=\b\n\a=\a\v\6B\4\2\0019\4\f\1\18\6\2\0'\b\r\0'\t\r\0'\n\14\0B\6\4\0A\4\0\0019\4\15\0014\6\3\0\18\a\2\0'\t\16\0'\n\16\0005\v\17\0B\a\4\2\18\t\a\0009\a\18\a9\n\19\3'\f\20\0B\n\2\0A\a\1\2\18\t\a\0009\a\18\a9\n\21\3'\f\22\0)\r\3\0B\n\3\0A\a\1\2\18\t\a\0009\a\23\a9\n\24\3B\n\1\0A\a\1\2\18\t\a\0009\a\25\a9\n\19\3'\f\26\0B\n\2\0A\a\1\2\18\t\a\0009\a\27\a9\n\24\3B\n\1\0A\a\1\0?\a\0\0B\4\2\0019\4\15\0014\6\3\0\18\a\2\0'\t\r\0'\n\r\0'\v\14\0B\a\4\2\18\t\a\0009\a\18\a3\n\28\0B\a\3\0?\a\0\0B\4\2\0016\4\29\0006\6\0\0'\a\30\0B\4\3\3\15\0\4\0X\6\14Ä6\6\0\0'\b\31\0B\6\2\0025\a \0009\b!\5\18\n\b\0009\b\"\b'\v#\0009\f$\0065\14%\0006\15&\0=\15&\14B\f\2\0A\b\2\0016\6\0\0'\b'\0B\6\2\0029\6\4\0065\b)\0005\t(\0=\t*\bB\6\2\0016\6\0\0'\b+\0B\6\2\0029\a\15\0014\t\3\0\18\n\2\0'\f,\0'\r,\0'\14\b\0B\n\4\2\18\f\n\0009\n\18\n9\r-\0065\15.\0B\r\2\0A\n\1\2>\n\1\t\18\n\2\0'\f\16\0'\r\16\0'\14\b\0B\n\4\2\18\f\n\0009\n\18\n9\r/\0065\0150\0B\r\2\0A\n\1\0?\n\1\0B\a\2\1K\0\1\0\1\2\0\0\rfunction\19is_not_ts_node\1\3\0\0\vstring\fcomment\15is_ts_node\6%\28nvim-autopairs.ts-conds\14autopairs\1\0\0\1\0\1\venable\2\28nvim-treesitter.configs\rmap_char\1\0\0\20on_confirm_done\17confirm_done\aon\nevent\1\0\2\btex\6{\ball\6(\"nvim-autopairs.completion.cmp\bcmp\npcall\0\fwith_cr\axx\rwith_del\tnone\14with_move\bxxx\27not_before_regex_check\a%%\26not_after_regex_check\14with_pair\1\3\0\0\btex\nlatex\6$\14add_rules\btex\a$$\radd_rule\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\1\0\1\rcheck_ts\2\nsetup\25nvim-autopairs.conds\24nvim-autopairs.rule\19nvim-autopairs\frequire\3ÄÄ¿ô\4\5ÄÄ¿ô\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\nœ\3\0\1\4\0\b\0\t6\1\0\0009\1\1\0015\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2=\2\2\1K\0\1\0\17exclude_name\1\2\0\0\17package.json\15exclude_ft\1\2\0\0\15javascript\1\0\18\rclosable\2\rtabpages\2\14auto_hide\1\14animation\2\20maximum_padding\3\1\fletters:asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP\21semantic_letters\2\19maximum_length\3\30\nicons\2\20insert_at_start\1\18insert_at_end\1\16icon_pinned\bÔ§Ç\28icon_close_tab_modified\b‚óè\19icon_close_tab\bÔôï\28icon_separator_inactive\b‚ñé\26icon_separator_active\b‚ñé\23icon_custom_colors\1\14clickable\2\15bufferline\6g\bvim\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n⁄\b\0\1\b\0&\00076\1\0\0006\3\1\0'\4\2\0B\1\3\3\14\0\1\0X\3\5Ä6\3\3\0'\5\4\0B\3\2\1K\0\1\0X\3\3Ä6\3\3\0'\5\5\0B\3\2\0016\3\1\0'\5\2\0B\3\2\0029\3\6\0035\5\a\0005\6\b\0004\a\0\0=\a\t\6=\6\n\0055\6\v\0005\a\f\0=\a\t\6=\6\r\0055\6\14\0005\a\15\0=\a\16\6=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\0055\6\23\0005\a\22\0=\a\24\0065\a\25\0=\a\26\6=\6\27\0055\6\28\0005\a\29\0=\a\30\6=\6\31\0055\6 \0004\a\0\0=\a\t\0065\a!\0=\a\"\6=\6#\0055\6$\0=\6%\5B\3\2\1K\0\1\0\frainbow\1\0\3\venable\1\19max_file_lines\3Ë\a\18extended_mode\2\15playground\16keybindings\1\0\n\14goto_node\t<cr>\14show_help\6?\vupdate\6R\21unfocus_language\6F\19focus_language\6f\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\1\0\3\venable\1\15updatetime\3\25\20persist_queries\1\17textsubjects\fkeymaps\1\0\2\6;\21textsubjects-big\6.\23textsubjects-smart\1\0\1\venable\1\16textobjects\vselect\1\0\1\venable\1\tswap\1\0\0\1\0\1\venable\1\fautotag\1\0\1\venable\1\fmatchup\1\0\1\venable\1\26context_commentstring\vconfig\1\0\a\thtml\16<!-- %s -->\tscss\r/* %s */\bcss\r/* %s */\tjson\5\15typescript\n// %s\bvue\16<!-- %s -->\vsvelte\16<!-- %s -->\1\0\1\venable\2\vindent\1\4\0\0\vpython\thtml\15javascript\1\0\1\venable\2\14highlight\fdisable\1\0\2&additional_vim_regex_highlighting\2\venable\2\1\0\2\17sync_install\1\21ensure_installed\15maintained\nsetup,treesitter configs successfully loading\29error loading treesitter\nprint\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÄ\r\0\1\b\0:\0m6\1\0\0009\1\1\1)\2\0\0=\2\2\0016\1\0\0009\1\1\1)\2\0\0=\2\3\0016\1\0\0009\1\1\1)\2\0\0=\2\4\0016\1\0\0009\1\1\1)\2\1\0=\2\5\0016\1\0\0009\1\1\1)\2\0\0=\2\6\0016\1\0\0009\1\1\1'\2\b\0=\2\a\0016\1\0\0009\1\1\1)\2\0\0=\2\t\0016\1\0\0009\1\1\1)\2\0\0=\2\n\0016\1\0\0009\1\1\1)\2\0\0=\2\v\0016\1\0\0009\1\1\1'\2\r\0=\2\f\0016\1\0\0009\1\1\1'\2\15\0=\2\14\0016\1\0\0009\1\1\1)\2\1\0=\2\16\0016\1\0\0009\1\1\1)\2\1\0=\2\17\0016\1\0\0009\1\1\1)\2Ë\3=\2\18\0016\1\0\0009\1\1\0015\2\21\0005\3\20\0=\3\22\0025\3\23\0=\3\24\2=\2\19\0016\1\0\0009\1\1\0015\2\26\0=\2\25\0016\1\0\0009\1\1\0015\2\28\0005\3\29\0=\3\30\0025\3\31\0=\3 \2=\2\27\0016\1!\0'\3\"\0B\1\2\0029\2#\0015\4$\0004\5\0\0=\5%\0045\5&\0=\5'\0045\5(\0005\6)\0=\6*\5=\5+\0045\5,\0004\6\0\0=\6-\5=\5.\0045\5/\0004\6\0\0=\0060\5=\0051\0045\0052\0004\6\0\0=\0063\5=\0054\0045\0055\0005\0066\0004\a\0\0=\a7\6=\0068\5=\0059\4B\2\2\1K\0\1\0\tview\rmappings\tlist\1\0\1\16custom_only\1\1\0\4\tside\tleft\21hide_root_folder\1\nwidth\3\30\16auto_resize\2\ffilters\vcustom\1\0\1\rdotfiles\1\16system_open\targs\1\0\0\24update_focused_file\16ignore_list\1\0\2\15update_cwd\2\venable\2\16diagnostics\nicons\1\0\4\fwarning\bÔÅ±\thint\bÔÅ™\tinfo\bÔÅö\nerror\bÔÅó\1\0\1\venable\2\22update_to_buf_dir\1\0\2\14auto_open\2\venable\2\23ignore_ft_on_setup\1\0\a\15update_cwd\2\18hijack_cursor\1\16open_on_tab\1\15auto_close\2\18open_on_setup\1\17hijack_netrw\1\18disable_netrw\1\nsetup\14nvim-tree\frequire\vfolder\1\0\b\15empty_open\bÔÑï\nempty\bÔÑî\fsymlink\bÔíÇ\17arrow_closed\bÔë†\17symlink_open\bÓóæ\15arrow_open\bÔëº\fdefault\bÓóø\topen\bÓóæ\bgit\1\0\a\vstaged\b‚úì\runstaged\b‚úó\fdeleted\bÔëò\fignored\b‚óå\14untracked\b‚òÖ\frenamed\b‚ûú\runmerged\bÓúß\1\0\2\fdefault\bÓòí\fsymlink\bÔíÅ\20nvim_tree_icons\1\0\4\nfiles\3\1\bgit\3\1\18folder_arrows\3\1\ffolders\3\1\25nvim_tree_show_icons\fbuftype\1\2\0\0\rterminal\rfiletype\1\0\0\1\4\0\0\vnotify\vpacker\aqf$nvim_tree_window_picker_exclude\27nvim_tree_refresh_wait&nvim_tree_create_in_closed_folder\30nvim_tree_respect_buf_cwd\n ‚ûõ \28nvim_tree_symlink_arrow\6 \27nvim_tree_icon_padding$nvim_tree_disable_window_picker\26nvim_tree_group_empty\27nvim_tree_add_trailing\a:t#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\29nvim_tree_indent_markers\27nvim_tree_quit_on_open\24nvim_tree_gitignore\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n≠\2\0\1\b\0\15\0\0216\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0044\5\0\0=\5\b\0044\5\0\0=\5\t\0046\5\n\0009\5\v\0059\5\f\5'\a\r\0B\5\2\2=\5\14\4B\2\2\1K\0\1\0\rdatapath\tdata\fstdpath\afn\bvim\17exclude_dirs\15ignore_lsp\rpatterns\1\b\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\22detection_methods\1\2\0\0\fpattern\1\0\3\17silent_chdir\2\16show_hidden\1\16manual_mode\1\nsetup\rgitsigns\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n∂\15\0\1\a\0 \0#6\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\14\0005\5\4\0005\6\3\0=\6\5\0055\6\6\0=\6\a\0055\6\b\0=\6\t\0055\6\n\0=\6\v\0055\6\f\0=\6\r\5=\5\15\0045\5\16\0005\6\17\0=\6\18\0055\6\19\0=\6\20\5=\5\21\0045\5\22\0=\5\23\0045\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\0045\5\30\0=\5\31\4B\2\2\1K\0\1\0\tyadm\1\0\1\venable\1\19preview_config\1\0\5\nstyle\fminimal\vborder\vsingle\rrelative\vcursor\brow\3\0\bcol\3\1&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\4\18virt_text_pos\beol\14virt_text\2\22ignore_whitespace\1\ndelay\3Ë\a\17watch_gitdir\1\0\2\rinterval\3Ë\a\17follow_files\2\fkeymaps\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\1\0\r\17n <leader>hp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>hb9<cmd>lua require\"gitsigns\".blame_line{full=true}<CR>\tx ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>hR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\to ih::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17v <leader>hrT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hU8<cmd>lua require\"gitsigns\".reset_buffer_index()<CR>\17n <leader>hr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\fnoremap\2\17n <leader>hu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17n <leader>hS2<cmd>lua require\"gitsigns\".stage_buffer()<CR>\17v <leader>hsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>hs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\nsigns\1\0\t\vlinehl\1\nnumhl\1\20max_file_length\3¿∏\2\14word_diff\1\20update_debounce\3d\18sign_priority\3\6\24attach_to_untracked\2\15signcolumn\2\23current_line_blame\1\17changedelete\1\0\4\ttext\b‚ñé\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\14topdelete\1\0\4\ttext\bÔ§â\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vdelete\1\0\4\ttext\bÔ§â\ahl\19GitSignsDelete\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\vchange\1\0\4\ttext\b‚ñé\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ttext\b‚ñé\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nƒ\1\0\1\6\0\n\0\r6\1\0\0'\3\1\0B\1\2\0029\2\2\0015\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\0045\5\b\0=\5\t\4B\2\2\1K\0\1\0\rmappings\1\0\3\rextended\1\nextra\2\nbasic\2\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\1\0\2\fpadding\2\vsticky\2\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
