{
  flake.modules.homeManager.sway =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        fastfetch
        discord
        google-chrome
        wl-clipboard
      ];
    };
}
