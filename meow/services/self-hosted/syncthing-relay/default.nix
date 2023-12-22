{ ... }: {
  services.syncthing.relay = {
    enable = true;

    providedBy = "Syncthing Relay by tuhana.me";
    
    extraOptions = [ "-pprof" ];
  };
}
