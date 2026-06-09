{
  den.aspects.void-ptr.nixos = {
    services.caddy = {
      enable = true;
      openFirewall = true;
    };
  };
}
