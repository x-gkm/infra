{
  flake.modules.nixos.base = {
    users.users.gkm.openssh.authorizedKeys.keyFiles = [
      ./id_ed25519_sk.pub
      ./id_ed25519.pub
    ];
    services.openssh.enable = true;
  };

  flake.modules.nixos.void-ptr =
    { config, ... }:
    {
      users.users.root.openssh.authorizedKeys = config.users.users.gkm.openssh.authorizedKeys;
    };
}
