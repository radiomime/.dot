local M = {}

-- TODO: add some of these impatient bits to whichkey?
-- :LuaCacheClear:
-- Remove the loaded cache and delete the cache file. A new cache file will be created the next time you load Neovim.
--
-- :LuaCacheLog:
-- View log of impatient.
--
-- :LuaCacheProfile:
-- View profiling data. To enable, Impatient must be setup with:
function M:configure()
	-- print("configuring impatient")
	local status_ok, impatient = pcall(require, "impatient")
	if not status_ok then
		return
	end

	impatient.enable_profile()
end

M.configure()

return M
