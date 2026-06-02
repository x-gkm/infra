{ inputs, ... }:
{
  flake.modules.nixos.base = {
    imports = [
      inputs.agenix.nixosModules.default
    ];

    # TODO: Don't hardcode the system.
    environment.systemPackages = [ inputs.agenix.packages.x86_64-linux.default ];
  };
}
