{
  den.aspects.sway.homeManager = {
    programs.imv.enable = true;

    xdg.mimeApps = {
      enable = true;
      defaultApplications =
        let
          mimeTypes = [
            # TODO: Parse this list from the desktop file.
            "image/x-farbfeld"
            "image/tiff"
            "image/tiff-fx"
            "image/png"
            "image/x-png"
            "image/jpeg"
            "image/jpg"
            "image/pjpeg"
            "image/svg+xml"
            "image/gif"
            "image/bmp"
            "image/x-bmp"
            "image/heif"
            "image/avif"
            "image/jxl"
            "image/webp"
            "image/qoi"
          ];
        in
        builtins.listToAttrs (
          map (mime: {
            name = mime;
            value = [ "imv.desktop" ];
          }) mimeTypes
        );
    };
  };
}
