{
  den.aspects.gkm-laptop.nixos =
    { pkgs, ... }:
    {
      services.pcscd.enable = true;
      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
      environment.systemPackages = [ pkgs.yubikey-manager ];
    };
}
