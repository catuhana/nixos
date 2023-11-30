{ ... }: {
  imports = [
    ./boot.nix
    ./filesystems.nix
    ./locale.nix
    ./networking.nix
    ./security.nix
  ];
}
