{ config, lib, ... }:
let
  cfg = config.services.syncthing.relay;
in
{
  services.syncthing.relay = {
    enable = true;

    providedBy = config.networking.domain;

    extraOptions = [ "-pprof" ];
  };

  networking.firewall.allowedTCPPorts = lib.mkIf cfg.enable [ cfg.statusPort cfg.port ];
}
