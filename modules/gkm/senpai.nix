{
  den.aspects.gkm.homeManager =
    { config, pkgs, ... }:
    {
      sops.secrets."soju/gkm" = { };

      programs.senpai = {
        enable = true;
        config = {
          address = "void-ptr.cc";
          nickname = "gkm";
          password-cmd = [
            "sh"
            "-c"
            "cat ${config.sops.secrets."soju/gkm".path}"
          ];
        };
      };
    };
}
