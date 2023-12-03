{ config, ... }: {
  services."forgejo" = {
    enable = true;

    database.type = "postgres";

    settings = {
      session.COOKIE_SECURE = true;

      server = {
        ROOT_URL = "https://git.tuhana.me:443";
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
}
