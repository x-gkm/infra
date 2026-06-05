{
  den.aspects.gkm-laptop.nixos = {
    services.udisks2.enable = true;
  };

  den.aspects.sway.homeManager = {
    services.udiskie.enable = true;
  };
}
