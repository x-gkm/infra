{
  den.aspects.gkm.homeManager =
    { pkgs, ... }:
    {
      programs.password-store = {
        enable = true;
        package = pkgs.pass-wayland;
      };
    };
}
