{ config, lib, ... }:
let
  self = config.services.caddy;
in
{
  services.caddy = {
    enable = true;

    email = "acme@${config.networking.domain}";

    logFormat = lib.mkForce ''
      level INFO
      format console
    '';
  };

  networking.firewall = lib.mkIf self.enable {
    allowedTCPPorts = [ 80 443 ];
    allowedUDPPorts = [ 443 ];
  };
}
