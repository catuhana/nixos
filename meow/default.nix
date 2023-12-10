{ ... }: {
  imports = [ ./agenix.nix ./services ./system ./users ];

  system.stateVersion = "24.05";
}
