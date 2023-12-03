{ ... }: {
  imports = [ ./agenix.nix ./services ./sys ./users ];

  system.stateVersion = "24.05";
}
