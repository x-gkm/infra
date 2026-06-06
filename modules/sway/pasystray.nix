{
  den.aspects.sway.homeManager = {
    services.pasystray.enable = true;

    wayland.windowManager.sway.extraConfig = ''
      for_window [app_id="pavucontrol"] {
          floating enable
          move position center
      }
    '';
  };
}
