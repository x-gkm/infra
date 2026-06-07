{
  den.aspects.sway.homeManager =
    { pkgs, lib, ... }:
    {
      wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault {
        XF86MonBrightnessUp = "exec brightnessctl -q set +5%";
        XF86MonBrightnessDown = "exec brightnessctl -q set 5%-";
      };
    };
}
