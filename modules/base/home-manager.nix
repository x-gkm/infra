{ inputs, ... }:
{
  flake.modules.homeManager.base = {
    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
  };

  flake.modules.nixos.base = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };
    };
  };
}
