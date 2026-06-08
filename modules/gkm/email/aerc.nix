{
  den.aspects.gkm.homeManager =
    { pkgs, ... }:
    {
      programs.aerc = {
        enable = true;
        extraConfig = {
          general.unsafe-accounts-conf = true;
          filters = {
            "text/plain" = "colorize";
            "subject,~^\\[PATCH" = "hldiff";
            "text/html" = "html";
            "text/*" = "plaintext";
          };
        };
      };

      accounts.email.accounts.personal.aerc = {
        enable = true;
        extraAccounts =
          let
            gmailMapping = pkgs.writeText "folder-map" ''
              * = [Gmail]/*
            '';
          in
          {
            copy-to = "[Gmail]/Sent Mail";
            archive = "[Gmail]/All Mail";
            folder-map = "${gmailMapping}";
          };
      };

      accounts.email.accounts.school.aerc = {
        enable = true;
        extraAccounts = {
          archive = "Archives";
        };
      };
    };
}
