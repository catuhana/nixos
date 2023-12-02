{ ... }: {
  imports = [ ./secrets.nix ./services ./sys ./users ];

  system.stateVersion = "24.05";
}
