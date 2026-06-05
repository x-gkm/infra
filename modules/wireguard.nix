{
  den.aspects.void-ptr.nixos =
    { config, pkgs, ... }:
    {
      networking.nat = {
        enable = true;
        enableIPv6 = true;
        externalInterface = "ens3";
        internalInterfaces = [ "wg0" ];
      };

      age.secrets.wg0-key = {
        file = ../secrets/wg0-void-ptr.age;
      };

      networking.wg-quick.interfaces.wg0 = {
        type = "amneziawg";
        privateKeyFile = config.age.secrets.wg0-key.path;
        address = [
          "10.8.0.1/24"
          "fdf5:676b:56fa::1/64"
        ];
        listenPort = 9090;
        peers = [
          {
            publicKey = "fYgFFVmN6o5+A1soJl+6ddmWuR36+YITi0rwKEp8lR0=";
            allowedIPs = [
              "10.8.0.2/32"
              "fdf5:676b:56fa::2/128"
            ];
          }
          {
            publicKey = "a9HsIhzppLLaMgJ7Vf81yfis+mS5kLIZ98dVb/icPhk=";
            allowedIPs = [
              "10.8.0.3/32"
              "fdf5:676b:56fa::3/128"
            ];
          }
        ];

        postUp = ''
          ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.8.0.1/24 -o ens3 -j MASQUERADE
          ${pkgs.iptables}/bin/ip6tables -A FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/ip6tables -t nat -A POSTROUTING -s fdf5:676b:56fa::1/64 -o ens3 -j MASQUERADE
        '';

        preDown = ''
          ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.8.0.1/24 -o ens3 -j MASQUERADE
          ${pkgs.iptables}/bin/ip6tables -D FORWARD -i wg0 -j ACCEPT
          ${pkgs.iptables}/bin/ip6tables -t nat -D POSTROUTING -s fdf5:676b:56fa::1/64 -o ens3 -j MASQUERADE
        '';
      };

      networking.firewall.allowedUDPPorts = [ 9090 ];
    };

  den.aspects.gkm-laptop.nixos =
    { config, ... }:
    {
      age.secrets.wg0-key = {
        file = ../secrets/wg0-gkm-laptop.age;
      };

      networking.wg-quick.interfaces.wg0 = {
        type = "amneziawg";
        privateKeyFile = config.age.secrets.wg0-key.path;
        address = [
          "10.8.0.2/24"
          "fdf5:676b:56fa::2/64"
        ];
        dns = [
          "8.8.8.8"
          "8.8.4.4"
        ];
        peers = [
          {
            endpoint = "void-ptr.cc:9090";
            publicKey = "PZ+7H1jmWPFycy319iaHvw1Y4y0rtBYz4of2wNcEhAM=";
            allowedIPs = [
              "0.0.0.0/0"
              "::/0"
            ];
          }
        ];
      };
    };
}
