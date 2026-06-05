{ inputs, ... }:
{
  flake.modules.nixos.base =
    { pkgs, ... }:
    let
      inherit (pkgs.stdenv.hostPlatform) system;
    in
    {
      imports = [
        inputs.agenix.nixosModules.default
      ];

      environment.systemPackages = [ inputs.agenix.packages.${system}.default ];
    };
}
