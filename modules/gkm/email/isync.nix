{
  den.aspects.gkm.homeManager = {
    programs.mbsync.enable = true;

    accounts.email.accounts.personal.mbsync = {
      enable = true;
      create = "maildir";
      expunge = "both";
    };
    accounts.email.accounts.school.mbsync = {
      enable = true;
      create = "maildir";
      expunge = "both";
    };
  };
}
