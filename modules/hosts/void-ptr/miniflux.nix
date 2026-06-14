{
  den.aspects.void-ptr.nixos =
    { config, ... }:
    {
      sops.secrets."miniflux/env" = { };

      services.miniflux = {
        enable = true;
        config.LISTEN_ADDR = "localhost:8081";
        adminCredentialsFile = config.sops.secrets."miniflux/env".path;
      };

      services.caddy.virtualHosts."feeds.void-ptr.cc".extraConfig = ''
        handle {
          reverse_proxy localhost:8081
        }
      '';
    };
}
