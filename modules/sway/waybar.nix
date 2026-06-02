{
  flake.modules.homeManager.sway =
    { pkgs, ... }:
    {
      programs.waybar.enable = true;
      home.packages = [ pkgs.font-awesome ];
    };
}
