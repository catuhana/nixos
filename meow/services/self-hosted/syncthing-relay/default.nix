{ ... }: {
  services.syncthing.relay = {
    enable = true;

    providedBy = "Public Syncthing relay by tuhana.me";
    
    extraOptions = [ "-pprof" ];
  };
}
