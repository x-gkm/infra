{
  den.aspects.base.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        vim
      ];
      environment.variables = {
        EDITOR = "vim";
        VISUAL = "vim";
      };
    };
}
