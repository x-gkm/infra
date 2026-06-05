{
  den.aspects.base.nixos = {
    users.users.gkm.openssh.authorizedKeys.keyFiles = [
      ./id_ed25519_sk.pub
      ./id_ed25519.pub
    ];
    services.openssh.enable = true;
  };

  den.aspects.void-ptr.nixos =
    { config, ... }:
    {
      users.users.root.openssh.authorizedKeys = config.users.users.gkm.openssh.authorizedKeys;
    };
}
