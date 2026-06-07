{ den, inputs, ... }:
{
  den.aspects.base = {
    includes = [ den.batteries.inputs' ];
    nixos =
      { inputs', ... }:
      {
        imports = [
          inputs.agenix.nixosModules.default
        ];

        environment.systemPackages = [ inputs'.agenix.packages.default ];
      };

    homeManager = {
      imports = [ inputs.agenix.homeManagerModules.default ];
    };
  };

  flake-file.inputs.agenix = {
    url = "github:ryantm/agenix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
