{ ... }: {
  imports = [
    ./packages

    ./boot.nix
    ./filesystems.nix
    ./locale.nix
    ./networking.nix
    ./security.nix
  ];
}
