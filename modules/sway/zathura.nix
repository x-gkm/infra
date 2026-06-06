{
  den.aspects.sway.homeManager = {
    programs.zathura.enable = true;
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      };
    };
  };
}
