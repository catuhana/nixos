{ ... }: {
  imports = [ ./secrets.nix ./self-hosted ./sys ./users ];

  system.stateVersion = "24.05";
}
