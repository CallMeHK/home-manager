rec {
plugins = homePath: vimPlugins: {
  enable = true;
  defaultEditor = true;
  extraLuaConfig = ''
  	dofile("${homePath}/.config/home-manager/neovim/maps.lua")
  '';
  plugins = with vimPlugins;  [
     nvim-web-devicons
     (importPlugin homePath nvim-tree-lua "tree.lua")
     vim-smoothie
     (importPlugin homePath goyo-vim "goyo.lua")
     vim-fugitive
     auto-pairs
     nvim-ts-autotag
     (importPlugin homePath nvim-treesitter.withAllGrammars "treesitter.lua")
     (importPlugin homePath fzf-vim "fzf.lua")
     telescope-nvim
     plenary-nvim
     vim-sneak
     (importPlugin homePath nightfox-nvim "nightfox.lua")

     
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
  };
  importPlugin = homePath: plugin: config: {
	plugin = plugin;
	type = "lua";
	config = "dofile('${homePath}/.config/home-manager/neovim/${config}')";
  };
}
