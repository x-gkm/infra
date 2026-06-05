{ den, ... }:
{
  den.aspects.void-ptr = {
    includes = [
      den.aspects.base
      den.batteries.hostname
    ];

    nixos =
      {
        modulesPath,
        ...
      }:
      {
        imports = [
          (modulesPath + "/virtualisation/digital-ocean-config.nix")
        ];

        virtualisation.digitalOcean.rebuildFromUserData = false;
      };
  };
}
