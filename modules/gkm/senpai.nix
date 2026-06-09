{
  den.aspects.gkm.homeManager =
    { config, pkgs, ... }:
    {
      age.secrets.soju-gkm.file = ../../secrets/soju-gkm.age;

      programs.senpai = {
        enable = true;
        config = {
          address = "void-ptr.cc";
          nickname = "gkm";
          password-cmd = [ "sh" "-c" "cat ${config.age.secrets.soju-gkm.path}" ];
        };
      };
    };
}
