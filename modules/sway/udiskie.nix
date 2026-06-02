{
  flake.module.nixos.gkm-laptop = {
    services.udisks2.enable = true;
  };
  flake.modules.homeManager.sway = {
    services.udiskie.enable = true;
  };
}
