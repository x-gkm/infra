{
  flake.modules.homeManager.gkm =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        tree
        unzip
        zip
        yazi
      ];
    };
}
