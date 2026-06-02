{
  flake.modules.nixos.gkm-laptop = {
    services.blueman.enable = true;
    hardware.bluetooth.enable = true;
  };
  flake.modules.homeManager.sway =
    { osConfig, ... }:
    {
      services.blueman-applet.enable = true;
    };
}
