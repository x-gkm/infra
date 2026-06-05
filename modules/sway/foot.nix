{
  den.aspects.sway.homeManager =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.nerd-fonts.comic-shanns-mono ];
      fonts.fontconfig.enable = true;

      programs.foot = {
        enable = true;
        settings = {
          main = {
            font = "ComicShannsMono Nerd Font Mono:size=14";
            resize-by-cells = false;
            pad = "10x10";
          };
          "colors-dark" = {
            alpha = 0.8;
          };
        };
      };
    };
}
