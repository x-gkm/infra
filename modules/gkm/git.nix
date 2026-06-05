{
  den.aspects.gkm.homeManager = {
    programs.git = {
      enable = true;
      settings = {
        init = {
          defaultBranch = "main";
        };
        user = {
          email = "gokmen.kaplan.9163@gmail.com";
          name = "Gökmen Kaplan";
        };
      };
    };

    programs.gh.enable = true;
  };
}
