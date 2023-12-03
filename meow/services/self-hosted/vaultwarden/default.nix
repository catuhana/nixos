{ config, ... }: {
  services."vaultwarden" = {
    enable = false;

    dbBackend = "postgresql";
    environmentFile = config.age.secrets."services.self-hosted.vaultwarden.admin.token".path;

    config = {
      ROCKET_PORT = 8222;

      DOMAIN = "https://vault.tuhana.me";
      SIGNUPS_ALLOWED = false;
    };
  };
}
