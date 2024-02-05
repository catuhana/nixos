{ config, lib, ... }:
let
  cfg = config.services.vaultwarden;

  serviceDomain = "vault.${config.networking.domain}";
in
{
  services.vaultwarden = {
    enable = true;

    dbBackend = "postgresql";
    environmentFile = config.sops.secrets."services/self-hosted/vaultwarden/admin-token".path;

    config = {
      ROCKET_PORT = 10010;

      DATABASE_URL = "postgresql://vaultwarden@localhost/vaultwarden";

      DOMAIN = "https://${serviceDomain}";
      SIGNUPS_ALLOWED = false;
    };
  };

  services.postgresql = lib.mkIf cfg.enable {
    ensureUsers = [
      {
        name = "vaultwarden";
        ensureDBOwnership = true;
      }
    ];
    ensureDatabases = [ "vaultwarden" ];
  };

  services."caddy".virtualHosts."${serviceDomain}" = lib.mkIf cfg.enable {
    extraConfig = ''
      @admin_redir {
        path /admin*
        not remote_ip private_ranges
      }

      redir @admin_redir /

      header / {
        Strict-Transport-Security "max-age=31536000;"
        X-Frame-Options "SAMEORIGIN"
        X-Robots-Tag "noindex, nofollow"
        X-Content-Type-Options "nosniff"
        -Server
        -Last-Modified
      }

      reverse_proxy localhost:${toString cfg.config.ROCKET_PORT}
    '';
  };
}
