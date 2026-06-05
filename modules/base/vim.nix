{
  den.aspects.base.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        vim
      ];
    };
}
