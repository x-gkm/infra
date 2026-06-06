{ den, ... }:
{
  den.aspects.gkm-laptop = {
    includes = [
      den.aspects.base
      den.aspects.lanzaboote
      den.batteries.hostname
    ];

    nixos =
      { pkgs, ... }:
      {
        imports = [ ./_generated/hardware-configuration.nix ];

        networking.networkmanager.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;
        boot.loader.systemd-boot.enable = true;
        boot.kernelPackages = pkgs.linuxPackages_latest;
      };
  };
}
