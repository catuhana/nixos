{ ... }: {
  imports = [ ./services ./secrets ./system ./users ];

  system.stateVersion = "24.05";
}
