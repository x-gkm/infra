{
  den.aspects.sway.homeManager =
    { pkgs, ... }:
    {
      services.mako.enable = true;

      systemd.user.services.mako = {
        Unit = {
          Description = "Lightweight Wayland notification daemon";
          Documentation = "man:mako(1)";
        };

        Service = {
          Type = "dbus";
          BusName = "org.freedesktop.Notifications";
          ExecCondition = "/bin/sh -c '[ -n \"$WAYLAND_DISPLAY\" ]'";
          ExecStart = "${pkgs.mako}/bin/mako";
          ExecReload = "${pkgs.mako}/bin/makoctl reload";
        };

        Install = {
          WantedBy = [ "default.target" ];
        };
      };
    };
}
