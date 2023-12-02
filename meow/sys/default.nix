{ ... }: {
  imports = [
    ./boot.nix
    ./filesystems.nix
    ./locale.nix
    ./networking.nix
    ./packages.nix
    ./security.nix
  ];
}
