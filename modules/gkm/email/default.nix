{
  den.aspects.gkm.homeManager =
    { pkgs, ... }:
    {
      accounts.email.accounts.personal =
        let
          address = "gokmen.kaplan.9163@gmail.com";
          bwId = "b6a1848e-0ca4-4b89-906a-b46300ad24ba";
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
          passwordCommand = "bw get password ${bwId}";
        };

      accounts.email.accounts.school =
        let
          address = "240201050@sivas.edu.tr";
          bwId = "a30687d8-2722-49b8-95e3-b1fc01794f4b";
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
          passwordCommand = "bw get password ${bwId}";
        };
    };
}
