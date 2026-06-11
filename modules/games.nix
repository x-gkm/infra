{ den, ... }:
{
  den.aspects.games.homeManager =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [ osu-lazer-bin ];
    };
}
