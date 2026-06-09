let
  webroot = "/var/lib/acme/acme-challenge";
in
{
  den.aspects.void-ptr.nixos =
    { config, ... }:
    {
      security.acme = {
        acceptTerms = true;

        defaults = {
          email = "gokmen.kaplan.9163@gmail.com";
          inherit webroot;
        };

        certs."void-ptr.cc" = {
          extraDomainNames = [ "feeds.void-ptr.cc" ];
        };
      };

      services.caddy.virtualHosts = {
        "void-ptr.cc" = {
          useACMEHost = "void-ptr.cc";
          extraConfig = ''
            handle /.well-known/acme-challenge/* {
              root ${webroot}
              file_server
            }
          '';
        };

        "feeds.void-ptr.cc" = {
          useACMEHost = "void-ptr.cc";
          extraConfig = ''
            handle /.well-known/acme-challenge/* {
              root ${webroot}
              file_server
            }
          '';
        };
      };

      # Override caddy's config.
      security.acme.certs."void-ptr.cc".group = "acme";
      systemd.services.caddy.serviceConfig.SupplementaryGroups = [ "acme" ];
    };
}
