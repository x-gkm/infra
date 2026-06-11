{
  den.aspects.gkm-laptop = {
    nixos = {
      hardware.graphics.enable = true;
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.nvidia.open = true;

      programs.sway.extraOptions = [ "--unsupported-gpu" ];
    };

    homeManager = {
      wayland.windowManager.sway.extraOptions = [ "--unsupported-gpu" ];
    };
  };
}
