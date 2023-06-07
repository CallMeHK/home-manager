local map = vim.api.nvim_set_keymap


local ok_tree, tree = pcall(require, 'nvim-tree')
if not ok_tree then
	vim.notify(tree, vim.log.levels.ERROR)
else
	vim.g.nvim_tree_disable_default_keybindings = 1

local bindings = { -- BEGIN_DEFAULT_MAPPINGS
    { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
    { key = "<C-e>",                          action = "edit_in_place" },
    { key = "O",                              action = "edit_no_picker" },
    { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
    { key = "<C-v>",                          action = "vsplit" },
    { key = "<C-x>",                          action = "split" },
    { key = "<C-t>",                          action = "tabnew" },
    { key = "<",                              action = "prev_sibling" },
    { key = ">",                              action = "next_sibling" },
    { key = "P",                              action = "parent_node" },
    { key = "<BS>",                           action = "close_node" },
    { key = "<Tab>",                          action = "preview" },
    { key = "9",                              action = "first_sibling" },
    { key = "0",                              action = "last_sibling" },
    { key = "C",                              action = "toggle_git_clean" },
    { key = "I",                              action = "toggle_git_ignored" },
    { key = "8",                              action = "toggle_dotfiles" },
    { key = "B",                              action = "toggle_no_buffer" },
    { key = "U",                              action = "toggle_custom" },
    { key = "R",                              action = "refresh" },
    { key = "a",                              action = "create" },
    { key = "d",                              action = "remove" },
    { key = "D",                              action = "trash" },
    { key = "r",                              action = "rename" },
    { key = "<C-r>",                          action = "full_rename" },
    { key = "e",                              action = "rename_basename" },
    { key = "x",                              action = "cut" },
    { key = "c",                              action = "copy" },
    { key = "p",                              action = "paste" },
    { key = "y",                              action = "copy_name" },
    { key = "Y",                              action = "copy_path" },
    { key = "gy",                             action = "copy_absolute_path" },
    { key = "[e",                             action = "prev_diag_item" },
    { key = "[c",                             action = "prev_git_item" },
    { key = "]e",                             action = "next_diag_item" },
    { key = "]c",                             action = "next_git_item" },
    { key = "-",                              action = "dir_up" },
    { key = "s",                              action = "system_open" },
    { key = "f",                              action = "live_filter" },
    { key = "F",                              action = "clear_live_filter" },
    { key = "<C-q>",                          action = "close" },
    { key = "W",                              action = "collapse_all" },
    { key = "E",                              action = "expand_all" },
    { key = "S",                              action = "search_node" },
    { key = ".",                              action = "run_file_command" },
    { key = "<C-k>",                          action = "toggle_file_info" },
    { key = "g?",                             action = "toggle_help" },
    { key = "m",                              action = "toggle_mark" },
    { key = "bmv",                            action = "bulk_move" },
  } -- END_DEFAULT_MAPPINGS

-- OR setup with some options
tree.setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
      custom_only = true,
			list = bindings,
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
			window_picker = {
				enable = false,
			},
		},
	},
	tab = {
		sync = {
			close = true,
		},
	},
})

local git = require("nvim-tree.git")

-- git.ignore = false
end

local ok_icons, icons = pcall(require, 'nvim-web-devicons')
if not ok_icons then
	vim.notify(icons, vim.log.levels.ERROR)
else
	-- MUST SET FONT TO A NERD FONT FOR ICONS TO WORK
	-- FiraCode Nerd Font Mono: https://www.nerdfonts.com/font-downloads
	icons.setup()
end


