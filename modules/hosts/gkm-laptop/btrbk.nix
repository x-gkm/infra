{
  den.aspects.gkm-laptop.nixos = {
    services.btrbk.instances.btrbk = {
      onCalendar = "hourly";
      settings = {
        timestamp_format = "long";
        snapshot_preserve = "14d";
        snapshot_preserve_min = "2d";
        volume = {
          "/btrfs" = {
            snapshot_dir = "btrbk-snapshots";
            subvolume = {
              "home" = { };
              "root" = { };
            };
          };
        };
      };
    };
  };
}
