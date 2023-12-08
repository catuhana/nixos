{ config, ... }: {
  services."forgejo" = {
    enable = true;

    database.type = "postgres";

    settings = {
      session.COOKIE_SECURE = true;

      server = {
        HTTP_PORT = 10000;

        ROOT_URL = "https://git.tuhana.me";
        DOMAIN = "git.tuhana.me";
        DISABLE_SSH = true;
      };

      service = { DISABLE_REGISTRATION = true; };

      actions = { ENABLED = true; };
    };
  };

  services."gitea-actions-runner".instances."forgejo" = {
    enable = true;

    name = config.networking.hostName;
    url = "https://git.tuhana.me";
    tokenFile = config.age.secrets."services.self-hosted.forgejo.gitea-actions-runner.token".path;

    labels = [ "native:host" ];
  };

  services."caddy".virtualHosts."git.tuhana.me" = {
    extraConfig = ''
      reverse_proxy localhost:${toString config.services."forgejo".settings.server.HTTP_PORT}
    '';
  };
}
