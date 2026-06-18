{ den, ... }:
{
  den.aspects.void-ptr = {
    includes = [ den.batteries.inputs' ];
    nixos =
      { config, pkgs, inputs', ... }:
      let
        environment = {
          DATABASE_URL = "postgres://algoooo@%%2Frun%%2Fpostgresql/algoooo";
        };
        algoooo = inputs'.algoooo.packages.default;
        port = "8082";
        parametersFile = pkgs.writeTextFile {
          name = "parameters.yaml";
          text = ''
            average_elo: 1500
            n0: 30
            user_k_bounds:
              min: 32
              max: 80
            problem_k_bounds:
              min: 5
              max: 10
          '';
        };
      in
      {
        sops.secrets.algoleague = { };

        users.users.algoooo = {
          isSystemUser = true;
          group = "algoooo";
        };

        users.groups.algoooo = { };

        services.postgresql = {
          ensureUsers = [
            {
              name = "algoooo";
              ensureDBOwnership = true;
            }
          ];
          ensureDatabases = [ "algoooo" ];
        };

        systemd.timers.algoooo-fetch-and-rate = {
          wantedBy = [ "timers.target" ];
          timerConfig = {
            OnCalendar = "daily";
            Unit = "algoooo-fetch-and-rate.service";
          };
        };

        systemd.services.algoooo-fetch-and-rate = {
          description = "Algoooo fetch and rate";
          requires = [
            "algoooo-dbsetup.service"
            "postgresql.target"
          ];
          after = [
            "algoooo-dbsetup.service"
            "postgresql.target"
          ];
          serviceConfig = {
            Type = "oneshot";
            User = "algoooo";
            ExecStart = pkgs.writeScript "algoooo-fetch-and-rate" ''
              #!${pkgs.runtimeShell}
              ${algoooo}/bin/algoooo fetch
              ${algoooo}/bin/algoooo rate -c ${parametersFile}
            '';
            EnvironmentFile = config.sops.secrets.algoleague.path;
          };
          inherit environment;
        };

        systemd.services.algoooo-dbsetup = {
          description = "Algoooo database setup";
          requires = [
            "postgresql.target"
          ];
          after = [
            "postgresql.target"
          ];
          serviceConfig = {
            Type = "oneshot";
            User = "algoooo";
            ExecStart = "${algoooo}/bin/algoooo migrate";
          };
          inherit environment;
        };

        systemd.services.algoooo = {
          description = "Algoooo service";
          wantedBy = [ "multi-user.target" ];
          requires = [
            "algoooo-dbsetup.service"
            "postgresql.target"
          ];
          after = [
            "network.target"
            "algoooo-dbsetup.service"
            "postgresql.target"
          ];
          serviceConfig = {
            ExecStart = "${algoooo}/bin/algoooo serve -p ${port}";
            User = "algoooo";
          };
          inherit environment;
        };

        services.caddy.virtualHosts."algoooo.void-ptr.cc".extraConfig = ''
          handle {
            reverse_proxy localhost:${port}
          }
        '';

      };
  };

  flake-file.inputs = {
    algoooo = {
      url = "github:x-gkm/algoooo";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
