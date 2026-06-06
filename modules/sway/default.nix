{ self, den, ... }:
{
  den.aspects.sway.homeManager = {
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

  den.aspects.gkm-laptop = {
    nixos = {
      programs.regreet = {
        enable = true;
        cageArgs = [
          "-m"
          "last"
        ];
      };

      programs.sway.enable = true;
      services.libinput.enable = true;
    };

    provides.to-users.includes = [ den.aspects.sway ];
  };
}
