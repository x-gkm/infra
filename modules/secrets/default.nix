{ inputs, ... }:
let
  defaultSopsFile = ./secrets.yaml;
in
{
  den.aspects.secrets = {
    nixos =
      { pkgs, ... }:
      {
        imports = [ inputs.sops-nix.nixosModules.sops ];
        environment.systemPackages = [ pkgs.sops ];
        sops = {
          inherit defaultSopsFile;
        };
      };

    homeManager = {
      imports = [ inputs.sops-nix.homeManagerModules.sops ];
      sops = {
        age.sshKeyPaths = [ "/home/gkm/.ssh/id_ed25519" ];
        inherit defaultSopsFile;
      };
    };
  };

  flake-file.inputs = {
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
