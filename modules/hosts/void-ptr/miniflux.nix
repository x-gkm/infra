{
  den.aspects.void-ptr.nixos =
    { config, ... }:
    {
      age.secrets.miniflux-env = {
        file = ../../../secrets/miniflux-env.age;
      };

      services.miniflux = {
        enable = true;
        config.LISTEN_ADDR = "localhost:8081";
        adminCredentialsFile = config.age.secrets.miniflux-env.path;
      };

      services.caddy.virtualHosts."feeds.void-ptr.cc".extraConfig = ''
        handle {
          reverse_proxy localhost:8081
        }
      '';
    };
}
