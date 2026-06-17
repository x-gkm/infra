{
  den.aspects.gkm-laptop.nixos =
    { lib, ... }:
    {
      config.services.postgresql = {
        authentication = lib.mkForce ''
          #type database  DBuser  auth-method
          local all       all     trust
        '';
      };
    };
}
