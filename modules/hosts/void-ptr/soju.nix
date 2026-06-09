{
  den.aspects.void-ptr.nixos = {
    services.soju.enable = true;

    networking.firewall.allowedTCPPorts = [ 6697 ];
  };
}
