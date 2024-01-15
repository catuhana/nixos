{ config, lib, ... }:
let
  self = config.services.forgejo;

  serviceDomain = "git.tuhana.me";
in
{
  services.forgejo = {
    enable = false;

    database.type = "postgres";

    settings = {
      session.COOKIE_SECURE = true;

      server = {
        HTTP_PORT = 10000;

        ROOT_URL = "https://${serviceDomain}";
        DOMAIN = "${serviceDomain}";
        DISABLE_SSH = true;
      };

      service = { DISABLE_REGISTRATION = true; };

      actions = { ENABLED = true; };
    };
  };

  services.gitea-actions-runner.instances."forgejo" = lib.mkIf self.enable {
    enable = true;

    name = config.networking.hostName;
    url = "https://${serviceDomain}";
    tokenFile = config.age.secrets."services.self-hosted.forgejo.gitea-actions-runner.token".path;
  };

  services.postgresql = lib.mkIf self.enable {
    ensureUsers = [
      {
        name = "forgejo";
        ensureDBOwnership = true;
      }
    ];
    ensureDatabases = [ "forgejo" ];
  };

  services.caddy.virtualHosts."${serviceDomain}" = lib.mkIf self.enable {
    extraConfig = ''
      reverse_proxy localhost:${toString self.settings.server.HTTP_PORT}
    '';
  };
}
