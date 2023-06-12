rec {
plugins = homePath: vimPlugins: fromGitHub: {
  enable = true;
  defaultEditor = true;
  extraLuaConfig = ''
  	dofile("${homePath}/.config/home-manager/neovim/maps.lua")
  	dofile("${homePath}/.config/home-manager/neovim/setup.lua")

    -- fromGitHub configs
  	dofile("${homePath}/.config/home-manager/neovim/transparent.lua")

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
     lightline-vim
     (importPlugin homePath hop-nvim "hop.lua")
     (importPlugin homePath nvim-cmp "cmp.lua")
     cmp-buffer
     cmp-path
     cmp-cmdline 
     cmp-nvim-lsp
     cmp-nvim-lua
     luasnip
     cmp_luasnip
     (importPlugin homePath nvim-lspconfig "lsp.lua")
     mason-nvim
     mason-lspconfig-nvim
  # (fromGitHub "HEAD" "navarasu/onedark.nvim")
     (fromGitHub "HEAD" "xiyaowong/nvim-transparent")
     (importPlugin homePath auto-session "auto-session.lua")
     
   ];
  };
  importPlugin = homePath: plugin: config: {
	plugin = plugin;
	type = "lua";
	config = "dofile('${homePath}/.config/home-manager/neovim/${config}')";
  };
}
