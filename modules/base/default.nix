{
  den.aspects.base.nixos = {
    nix.settings.experimental-features = "nix-command flakes";
    nixpkgs.config.allowUnfree = true;
  };
}
