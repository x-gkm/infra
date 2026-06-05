{
  den.aspects.gkm-laptop.nixos = {
    services.blueman.enable = true;
    hardware.bluetooth.enable = true;
  };

  den.aspects.sway.homeManager = {
    services.blueman-applet.enable = true;
  };
}
