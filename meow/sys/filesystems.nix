{ ... }: {
  fileSystems = {
    "/" = {
      label = "NixOS";
      fsType = "ext4";
    };

    "/boot" = {
      label = "Boot";
      fsType = "vfat";
    };
  }
}
