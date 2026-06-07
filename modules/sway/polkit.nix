{
  den.aspects.sway = {
    nixos = {
      security.polkit.enable = true;
    };

    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.lxqt.lxqt-policykit
        ];

        wayland.windowManager.sway.extraConfig = ''
          for_window [title="Authentication Required"] {
              floating enable
              move position center
          }
        '';

        systemd.user.services.lxqt-policykit-agent = {
          Unit = {
            Description = "LXQt PolicyKit handler";
            Documentation = "man:lxqt-policykit-agent(1)";
          };

          Service = {
            ExecStart = "${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent";
          };

          Install = {
            WantedBy = [ "default.target" ];
          };
        };
      };
  };
}
