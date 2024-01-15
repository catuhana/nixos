{ config, lib, ... }:
let
  self = config.services.syncthing.relay;
in
{
  services.syncthing.relay = {
    enable = true;

    providedBy = "tuhana.me";

    extraOptions = [ "-pprof" ];
  };

  networking.firewall.allowedTCPPorts = lib.mkIf self.enable [ self.statusPort self.port ];
}
