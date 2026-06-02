{
  flake.modules.nixos.gkm-laptop = {
    users.users.gkm.extraGroups = [ "networkmanager" ];
  };
}
