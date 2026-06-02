{ self, ... }:
{
  flake.modules.homeManager.sway = {
    wayland.windowManager.sway = {
      enable = true;
      config = {
        modifier = "Mod4";
        gaps.inner = 10;
        output = {
          "*" = {
            bg = "${wallpapers/wallhaven-zpq1dg.jpg} fill";
          };
        };
        input = {
          "type:pointer" = {
            accel_profile = "flat";
          };
        };
        window.titlebar = false;
        bars = [ ];
      };
    };

    programs.swaylock.enable = true;
  };

  flake.modules.nixos.gkm-laptop = {
    programs.regreet = {
      enable = true;
      cageArgs = [
        "-m"
        "last"
      ];
    };

    programs.sway.enable = true;
  };

  flake.modules.homeManager.gkm =
    { lib, osConfig, ... }:
    {
      imports = lib.optional osConfig.programs.sway.enable self.modules.homeManager.sway;
    };
}
