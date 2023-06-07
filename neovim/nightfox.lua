local ok_nightfox, nightfox = pcall(require, 'nightfox')

if not ok_nightfox then
	vim.notify(ok_nightfox, vim.log.levels.ERROR)
else
	nightfox.setup({
	  options = {
	    colorblind = {
	      enable = true,
	      severity = {
	        protan = 0.3,
	        deutan = 0.6,
	      },
	    },
	  },
	})
	vim.cmd("colorscheme carbonfox")
	vim.g.lightline = { colorscheme = 'carbonfox' }
end
