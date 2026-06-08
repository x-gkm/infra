{
  den.aspects.gkm.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        tree
        unzip
        zip
        yazi
        restic
        bitwarden-cli
        tokei
        qrencode
      ];
    };
}
