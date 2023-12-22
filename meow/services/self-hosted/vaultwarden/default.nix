{ config, ... }:
let
  serviceDomain = "vault.tuhana.me";
in
{
  services.vaultwarden = {
    enable = true;

    dbBackend = "postgresql";
    environmentFile = config.age.secrets."services.self-hosted.vaultwarden.admin.token".path;

    config = {
      ROCKET_PORT = 10010;

      DATABASE_URL = "postgresql://vaultwarden@localhost/vaultwarden";

      DOMAIN = "https://${serviceDomain}";
      SIGNUPS_ALLOWED = false;
    };
  };

  services."caddy".virtualHosts."${serviceDomain}" = {
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

      reverse_proxy localhost:${toString config.services.vaultwarden.config.ROCKET_PORT}
    '';
  };
}
