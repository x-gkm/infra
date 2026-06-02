{
  inputs,
  self,
  lib,
  ...
}:
{
  flake.modules.nixos.void-ptr =
    {
      inputs,
      modulesPath,
      ...
    }:
    {
      imports = [
        (modulesPath + "/virtualisation/digital-ocean-config.nix")

        self.modules.nixos.base
      ];

      networking.hostName = "void-ptr";
      virtualisation.digitalOcean.rebuildFromUserData = false;
    };

  flake.nixosConfigurations.void-ptr = lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.modules.nixos.void-ptr
    ];
  };
}
