{ lib, self, ... }:
{
  flake.modules.nixos.gkm-laptop =
    { pkgs, ... }:
    {
      imports = [
        ./_generated/hardware-configuration.nix

        self.modules.nixos.base
        self.modules.nixos.lanzaboote
      ];

      networking.hostName = "gkm-laptop";
      networking.networkmanager.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.kernelPackages = pkgs.linuxPackages_latest;
    };

  flake.nixosConfigurations.gkm-laptop = lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.modules.nixos.gkm-laptop
    ];
  };
}
