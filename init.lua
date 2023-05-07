-- Import Config Files

require("files.base")
require("files.highlights")
require("files.maps")
require("files.plugins")

-- Clipboard
--
local has = vim.fn.has
local is_win = has("win32")
local is_wsl = has("wsl")
print(is_wsl)

if is_win then
	require("files.windows")
end
if is_wsl then
	require("files.wsl")
end
