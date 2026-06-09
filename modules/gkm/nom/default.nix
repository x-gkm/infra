{
  den.aspects.gkm.homeManager =
    { config, pkgs, ... }:
    {
      age.secrets.miniflux-gkm.file = ../../../secrets/miniflux-gkm.age;

      programs.nom = {
        enable = true;
        package = pkgs.nom.overrideAttrs (prev: {
          patches = (prev.patches or [ ]) ++ [ ./0001-Change-APIKey-to-APIKeyFile.patch ];
        });
        settings = {
          autoread = true;
          backends.miniflux = [
            {
              host = "https://feeds.void-ptr.cc";
              api_key_file = config.age.secrets.miniflux-gkm.path;
            }
          ];
        };
      };
    };
}
