{ den, ... }:
{
  den.aspects.base = {
    includes = [ den.aspects.secrets ];

    nixos = {
      nix.settings.experimental-features = "nix-command flakes";
      nixpkgs.config.allowUnfree = true;
    };
    homeManager = {
      xdg.configFile."nixpkgs/config.nix".text = ''
        {
          allowUnfree = true;
        }
      '';
    };
  };
}
