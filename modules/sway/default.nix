{ self, den, ... }:
{
  den.aspects.sway = {
    homeManager = {
      wayland.windowManager.sway = {
        enable = true;
        config = {
          modifier = "Mod4";
          gaps.inner = 10;
          window.titlebar = false;
          bars = [ ];
        };
      };

      programs.swaylock.enable = true;
    };

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
  };
}
