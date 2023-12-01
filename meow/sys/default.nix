{ ... }: {
  imports = [
    ./boot.nix
    ./filesystems.nix
    ./locale.nix
    ./networking.nix
    ./packages.nix
    ./secrets.nix
    ./security.nix
    ./ssh.nix
  ];
}
