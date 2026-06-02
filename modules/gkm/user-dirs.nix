{
  flake.modules.homeManager.gkm = {
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
