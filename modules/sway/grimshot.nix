{
  den.aspects.sway.homeManager =
    { pkgs, lib, ... }:
    {
      home.packages = [
        pkgs.sway-contrib.grimshot
      ];
      wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault {
        "Mod4+Shift+s" = "exec grimshot --notify --cursor savecopy anything";
      };
    };
}
