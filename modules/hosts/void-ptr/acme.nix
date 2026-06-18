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
          extraDomainNames = [ "feeds.void-ptr.cc" "algoooo.void-ptr.cc" ];
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

        "algoooo.void-ptr.cc" = {
          useACMEHost = "void-ptr.cc";
          extraConfig = ''
            handle /.well-known/acme-challenge/* {
              root ${webroot}
              file_server
            }
          '';
        };
      };

      services.soju =
        let
          inherit (config.security.acme.certs."void-ptr.cc") directory;
        in
        {
          hostName = "void-ptr.cc";
          tlsCertificate = "${directory}/cert.pem";
          tlsCertificateKey = "${directory}/key.pem";
        };

      security.acme.certs."void-ptr.cc" = {
        # Override caddy's config.
        group = "acme";
        reloadServices = [
          "caddy"
          "soju"
        ];
      };
      systemd.services.caddy.serviceConfig.SupplementaryGroups = [ "acme" ];
      systemd.services.soju.serviceConfig.SupplementaryGroups = [ "acme" ];
    };
}
