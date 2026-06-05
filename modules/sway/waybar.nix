{
  den.aspects.sway.homeManager =
    { pkgs, ... }:
    {
      programs.waybar.enable = true;
      home.packages = [ pkgs.font-awesome ];
    };
}
