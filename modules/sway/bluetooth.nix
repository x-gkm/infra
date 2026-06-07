{
  den.aspects.gkm-laptop.nixos = {
    services.blueman.enable = true;
    hardware.bluetooth.enable = true;
  };

  den.aspects.sway.homeManager = {
    services.blueman-applet.enable = true;

    wayland.windowManager.sway.extraConfig = ''
      for_window [app_id="blueman-manager"] {
          floating enable
          move position center
      }
    '';
  };
}
