{
  flake.modules.nixos.base = {
    users.users.gkm.extraGroups = [ "wheel" ];
  };
}
