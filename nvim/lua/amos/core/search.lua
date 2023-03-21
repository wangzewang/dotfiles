vim.api.nvim_set_keymap("n", "<leader><CR>", ":nohlsearch<CR><CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader><leader>",
	[[:let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>]],
	{ noremap = true, silent = true }
)
