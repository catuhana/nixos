{ config, lib, ... }:
let
  cfg = config.services.syncthing.relay;
in
{
  services.syncthing.relay = {
    enable = true;

    providedBy = "tuhana.me";

    extraOptions = [ "-pprof" ];
  };

  networking.firewall.allowedTCPPorts = lib.mkIf cfg.enable [ cfg.statusPort cfg.port ];
}
