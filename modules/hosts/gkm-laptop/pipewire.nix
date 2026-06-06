{
  den.aspects.gkm-laptop.nixos = {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };
  };
}
