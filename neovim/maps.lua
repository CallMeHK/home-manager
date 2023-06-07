local map = vim.api.nvim_set_keymap
local ok_builtin, builtin = pcall(require, 'telescope.builtin')
local ok_hop, hop = pcall(require, 'hop')
local ok_hop_hint, hop_hint = pcall(require, 'hop.hint')
local directions = hop_hint.HintDirection

vim.keymap.set("n", "e", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = "e"

options = { noremap = true }

-- General
map("i", "jk", "<esc>", options)
map("n", "<leader>r", ":so %<CR>", options)

-- Save, Quit
map("n", "<C-s>", ":w<cr>", options)
map("n", "<C-q>", ":q<cr>", options)

-- Navigation
map("n", "L", "<C-w><C-w>", options)
map("n", "H", "<C-w>W", options)
map("n", "J", "gT", options)
map("n", "K", "gt", options)
map("n", "<C-j>", "<C-o>", options)
map("n", "<C-k>", "<C-i>", options)
map("n", "K", "gt", options)
map("n", "<leader><leader>t", ":tabnew<cr>", options)
map("n", "<leader><leader>v", ":vsp<cr>", options)
map("n", "<leader><leader>c", ":sp<cr>", options)
map("n", "<C-n>", ":NvimTreeFindFile<cr>", options)
map("n", "<leader><C-n>", ":NvimTreeOpen<cr>", options)

-- Copy paste (doesnt work in WSL)
map("v", "<C-c>", '"+yi<ESC>', options)


if not ok_builtin then
	vim.notify(builtin, vim.log.levels.ERROR)
else
	-- Find and Search
	vim.keymap.set("n", "<leader><C-p>", "<cmd>Telescope find_files hidden=true<cr>", {})
	vim.keymap.set("n", "<C-p>", ":GFiles --cached --others --exclude-standard<CR>", {})
	vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
	vim.keymap.set("n", "<leader><C-f>", ":Rgx ", {})
	vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	vim.keymap.set("v", "<leader><leader>a", 'y:Rg <C-r>=fnameescape(@")<CR><CR>', {})
end

-- LSP
vim.keymap.set("n", "<leader>ln", ":NullLsInfo<CR>")
local reload = function()
	vim.cmd(":e")
end
local format = function()
	local Path = require("plenary.path")
	local eslint_exists = Path:new(".eslintrc.js"):exists()
	if eslint_exists then
	  vim.cmd(":w")
		local lint = "yarn eslint --fix " .. vim.fn.expand("%")
		os.execute(lint)
		if pcall(reload) then
			print("formatted:", lint)
		else
			print("no changes made")
		end
	else
		vim.lsp.buf.format({ timeout_ms = 20000 })
	end
end
-- vim.keymap.set('n', '<leader><leader>r', ':lua vim.lsp.buf.format({ timeout_ms = 20000 })<CR>')
vim.keymap.set("n", "<leader><leader>r", format)
vim.keymap.set("n", "<leader>r", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>R", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.cmd("command Err lua vim.diagnostic.setloclist()<CR>")
-- good info on commands: https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "<leader>gd", builtin.lsp_references, {})

-- Hop.nvim and sneak
vim.keymap.set("n", "<leader><leader>w", "<cmd>HopWord<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>j", "<cmd>HopLine<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader><leader>s", "<cmd>HopPattern<CR>", { noremap = true, silent = true })
vim.keymap.set("", "f", "<Plug>Sneak_f", { remap = true })
vim.keymap.set("", "F", "<Plug>Sneak_F", { remap = true })
vim.keymap.set("", "s", "<Plug>Sneak_s", { remap = true })
vim.keymap.set("", "S", "<Plug>Sneak_S", { remap = true })

-- Terminal
vim.cmd("tnoremap <Leader><Esc> <C-\\><C-n>")

-- SnipRun
vim.api.nvim_set_keymap('v', '<leader><leader>f', '<Plug>SnipRun', {})

-- Transparency
vim.keymap.set('n', '<leader><leader>-', '<cmd>TransparentToggle<CR>', { noremap = true, silent = true })
