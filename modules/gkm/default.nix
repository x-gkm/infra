{ self, inputs, ... }:
{
  flake.modules.homeManager.gkm =
    { osConfig, lib, ... }:
    {
      imports = [
        self.modules.homeManager.base
      ];
    };

  flake.modules.nixos.base = {
    users.users.gkm.isNormalUser = true;
    home-manager.users.gkm = self.modules.homeManager.gkm;
  };
}
