vim.api.nvim_set_keymap("n", "<leader>tr", ":NERDTreeToggle<CR>", { noremap = true, silent = true })

vim.g.NERDTreeWinPos = "right"
vim.g.NERDTreeWinSize = 36

vim.cmd("set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*")
vim.g.NERDTreeGitStatusWithFlags = 1

vim.cmd([[autocmd StdinReadPre * let s:std_in=1]])
vim.cmd([[autocmd VimEnter * NERDTree]])
vim.cmd([[autocmd VimEnter * execute "normal \<C-h>"]])

-- sync open file with NERDTree
function IsNERDTreeOpen()
	return vim.api.nvim_eval('exists("t:NERDTreeBufName")') == 1
		and vim.api.nvim_eval("bufwinnr(t:NERDTreeBufName)") ~= -1
end

function SyncTree()
	if vim.bo.modifiable and IsNERDTreeOpen() and #vim.fn.expand("%") > 0 and not vim.o.diff then
		vim.cmd("NERDTreeFind")
		vim.cmd("wincmd p")
	end
end

vim.cmd([[autocmd BufEnter * call v:lua.SyncTree()]])
