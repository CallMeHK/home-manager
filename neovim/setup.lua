local o = vim.o

-- General settings
o.ignorecase = true
o.smartcase = true
o.mouse = false
vim.cmd("set number")
vim.cmd("set signcolumn=number")
vim.cmd("syntax on")

-- Set tabs to two spaces
vim.cmd("set expandtab")
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
	pattern = { "*.njk", "*.ejs" },
	command = "set filetype=html",
})

vim.cmd("let g:goyo_width = '50%'")

vim.api.nvim_create_autocmd("WinEnter", {
    -- pattern = { "*" },
    command = "set cursorline",
})


vim.api.nvim_create_autocmd("WinLeave", {
    -- pattern = { "*" },
    command = "set nocursorline",
})
