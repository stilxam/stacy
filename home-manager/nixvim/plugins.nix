{
  programs.nixvim.plugins = {
    dap.enable=true;
    lightline.enable = true;
    telescope.enable = true;
    oil.enable = true;
    treesitter.enable = true;
    luasnip.enable = true;
    "web-devicons".enable = true;
    "dap-python".enable = true;
    lsp = {
      enable = true;
      servers = {
        pyright.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        nil_ls.enable = true;
	julials = {
	enable = true;
	package =  null;
	};
      };
    };
    cmp = {
      enable = true;
      autoEnableSources = true;
    };
    molten.enable = true;
    image.enable=true;
    jupytext.enable=true;
    jupytext.autoLoad=true;

    comment.enable = true;
    markdown-preview = {
      enable = true;
      autoLoad = true;
    };
  };
}
