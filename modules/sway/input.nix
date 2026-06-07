{
  den.aspects.sway.homeManager =
    { config, lib, ... }:
    {
      wayland.windowManager.sway.config = {
        input = {
          "type:keyboard" = {
            xkb_layout = "us,tr";
          };

          "type:pointer" = {
            accel_profile = "flat";
          };

          "type:touchpad" = {
            natural_scroll = "enabled";
            tap = "enabled";
          };
        };

        keybindings =
          let
            modifier = config.wayland.windowManager.sway.config.modifier;
          in
          lib.mkOptionDefault {
            "${modifier}+Control+Shift+Space" = "input \"type:keyboard\" xkb_switch_layout next";
          };
      };
    };
}
