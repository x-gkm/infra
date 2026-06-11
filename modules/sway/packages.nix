{
  den.aspects.sway.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        fastfetch
        discord
        google-chrome
        wl-clipboard
        zbar
        obsidian
      ];
    };
}
