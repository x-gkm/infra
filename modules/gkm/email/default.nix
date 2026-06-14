{
  den.aspects.gkm.homeManager =
    { pkgs, ... }:
    {
      accounts.email.accounts.personal =
        let
          address = "gokmen.kaplan.9163@gmail.com";
        in
        {
          primary = true;

          inherit address;
          userName = address;
          realName = "Gökmen Kaplan";
          imap = {
            host = "imap.gmail.com";
            port = 993;
          };
          smtp = {
            host = "smtp.gmail.com";
            port = 587;
            tls.useStartTls = true;
          };
          passwordCommand = "pass Email/${address}";
        };

      accounts.email.accounts.school =
        let
          address = "240201050@sivas.edu.tr";
        in
        {
          inherit address;
          userName = address;
          realName = "Gökmen Kaplan";
          imap = {
            host = "mail.sivas.edu.tr";
            port = 993;
          };
          smtp = {
            host = "mail.sivas.edu.tr";
            port = 587;
            tls.useStartTls = true;
          };
          passwordCommand = "pass Email/${address}";
        };
    };
}
