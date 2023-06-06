# { config, pkgs, lib, ... }:

# let
# pkgs = import <nixpkgs> {};
# in
vimPlugins: {
  enable = true;
  defaultEditor = true;
  extraLuaConfig = ''
  local map = vim.api.nvim_set_keymap

  options = { noremap = true }
  map("i", "jk", "<esc>", options)
  '';
  plugins = with vimPlugins;  [
     nvim-web-devicons
     {
	     plugin = nvim-tree-lua;
	     type = "lua";
	     config = ''
         local map = vim.api.nvim_set_keymap
         vim.g.loaded_netrw = 1
         vim.g.loaded_netrwPlugin = 1
         require("nvim-tree").setup()
	 -- MUST SET FONT TO A NERD FONT FOR ICONS TO WORK
	 -- FiraCode Nerd Font Mono: https://www.nerdfonts.com/font-downloads
	 require("nvim-web-devicons").setup()
         map("n", "<C-n>", ":NvimTreeFindFile<cr>", { noremap = true })
         map("n", "<leader><C-n>", ":NvimTreeOpen<cr>", { noremap = true })
	     '';
     }
# (fromGitHub "HEAD" "junegunn/goyo.vim")
# (fromGitHub "HEAD" "psliwka/vim-smoothie")
# (fromGitHub "HEAD" "michaelb/sniprun")
# (fromGitHub "HEAD" "tpope/vim-fugitive")
# (fromGitHub "HEAD" "jiangmiao/auto-pairs")
# (fromGitHub "HEAD" "windwp/nvim-ts-autotag")
# (fromGitHub "HEAD" "junegunn/fzf")
# (fromGitHub "HEAD" "junegunn/fzf.vim")
# (fromGitHub "HEAD" "nvim-telescope/telescope.nvim")
# (fromGitHub "HEAD" "nvim-tree/nvim-tree.lua")
# (fromGitHub "HEAD" "nvim-lua/plenary.nvim")
# (fromGitHub "HEAD" "nvim-treesitter/nvim-treesitter")
# (fromGitHub "HEAD" "justinmk/vim-sneak")
# (fromGitHub "HEAD" "EdenEast/nightfox.nvim")
# (fromGitHub "HEAD" "navarasu/onedark.nvim")
# (fromGitHub "HEAD" "itchyny/lightline.vim")
# (fromGitHub "HEAD" "xiyaowong/nvim-transparent")
# (fromGitHub "HEAD" "phaazon/hop.nvim")
# (fromGitHub "HEAD" "hrsh7th/nvim-cmp") 
# (fromGitHub "HEAD" "hrsh7th/cmp-buffer") 
# (fromGitHub "HEAD" "hrsh7th/cmp-path") 
# (fromGitHub "HEAD" "hrsh7th/cmp-cmdline") 
# (fromGitHub "HEAD" "hrsh7th/cmp-nvim-lsp")
# (fromGitHub "HEAD" "hrsh7th/cmp-nvim-lua")
# (fromGitHub "HEAD" "L3MON4D3/LuaSnip") 
# (fromGitHub "HEAD" "saadparwaiz1/cmp_luasnip") 
# (fromGitHub "HEAD" "neovim/nvim-lspconfig") 
# (fromGitHub "HEAD" "williamboman/mason.nvim") 
# (fromGitHub "HEAD" "williamboman/mason-lspconfig.nvim") 
# (fromGitHub "HEAD" "jose-elias-alvarez/null-ls.nvim") 
# (fromGitHub "HEAD" "rmagatti/auto-session")
 ];
}
