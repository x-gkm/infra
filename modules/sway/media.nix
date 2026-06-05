{
  den.aspects.sway.homeManager =
    { pkgs, lib, ... }:
    {
      wayland.windowManager.sway.extraConfig = ''
        bindsym --locked {
          XF86AudioPlay exec playerctl play-pause
          XF86AudioStop exec playerctl stop
        }
      '';

      wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault {
        XF86AudioForward = "exec playerctl position +10";
        XF86AudioNext = "exec playerctl next";
        XF86AudioPause = "exec playerctl pause";
        XF86AudioPrev = "exec playerctl previous";
        XF86AudioRewind = "exec playerctl position -10";
      };

      home.packages = with pkgs; [
        playerctl
      ];
    };
}
