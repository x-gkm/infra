{
  den.aspects.sway.homeManager = {
    services.kanshi = {
      enable = true;
      settings = [
        {
          profile.name = "undocked";
          profile.outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
            }
          ];
        }
        {
          profile.name = "docked";
          profile.outputs = [
            {
              criteria = "eDP-1";
              status = "disable";
            }
            {
              criteria = "Media4 Inc GB-2717FF 0x00000001";
              mode = "1920x1080@165Hz";
            }
          ];
        }
      ];
    };
  };
}
