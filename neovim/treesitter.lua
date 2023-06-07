local ok_treesitter, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok_treesitter then
	vim.notify(treesitter, vim.log.levels.ERROR)
else
	treesitter.setup({
	  highlight = { enable = true },
	  autotag = { enable = true },
	})
end
