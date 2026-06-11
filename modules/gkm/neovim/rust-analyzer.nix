{
  den.aspects.gkm.homeManager = {
    programs.nixvim = {
      plugins.lsp = {
        enable = true;
        servers.rust_analyzer.enable = true;
      };
    };
  };
}
