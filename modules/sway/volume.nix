{
  den.aspects.sway.homeManager = {
    wayland.windowManager.sway.extraConfig = ''
      bindsym --locked {
          XF86AudioRaiseVolume exec wpctl set-volume @DEFAULT_SINK@ -l 1.0 5%+
          XF86AudioLowerVolume exec wpctl set-volume @DEFAULT_SINK@ -l 1.0 5%-
          XF86AudioMute        exec wpctl set-mute @DEFAULT_SINK@ toggle
          XF86AudioMicMute     exec wpctl set-mute @DEFAULT_SOURCE@ toggle
      }
    '';
  };
}
