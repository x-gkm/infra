{
  den.aspects.gkm.homeManager =
    { config, ... }:
    {
      sops.secrets."miniflux/gkm" = { };

      programs.newsboat.enable = true;

      xdg.configFile."newsboat/config".text = ''
        urls-source "miniflux"
        miniflux-url "https://feeds.void-ptr.cc/"
        miniflux-tokeneval "sh -c \"cat \\\"${config.sops.secrets."miniflux/gkm".path}\\\"\""
      '';
    };
}
