{
  den.aspects.gkm.homeManager =
    { config, ... }:
    {
      age.secrets.miniflux-gkm.file = ../../secrets/miniflux-gkm.age;

      programs.newsboat.enable = true;

      xdg.configFile."newsboat/config".text = ''
        urls-source "miniflux"
        miniflux-url "https://feeds.void-ptr.cc/"
        miniflux-tokeneval "sh -c \"cat \\\"${config.age.secrets.miniflux-gkm.path}\\\"\""
      '';
    };
}
