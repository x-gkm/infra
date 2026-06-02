{
  flake.modules.homeManager.sway =
    { pkgs, osConfig, ... }:
    {
      home.packages = [
        pkgs.discord
      ];
    };
}
