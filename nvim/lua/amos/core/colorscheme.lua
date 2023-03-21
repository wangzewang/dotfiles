-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme base16-gruvbox-material-dark-medium")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

vim.opt.termguicolors = true
require("bufferline").setup({})
