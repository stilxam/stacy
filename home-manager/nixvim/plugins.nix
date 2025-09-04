{
  programs.nixvim.plugins = {
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
      };
    };
    cmp = {
      enable = true;
      autoEnableSources = true;
    };
    molten.enable = true;
    comment.enable = true;
  };
}
