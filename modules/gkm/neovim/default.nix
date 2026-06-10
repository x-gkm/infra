{ inputs, ... }:
{
  den.aspects.gkm.homeManager =
    { pkgs, ... }:
    {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      programs.nixvim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        nixpkgs = { inherit pkgs; };
      };
    };

    flake-file.inputs.nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
}
