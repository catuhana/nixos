{ ... }: {
  services."forgejo" = {
    enable = true;

    database.type = "postgres";

    settings = {
      session.COOKIE_SECURE = true;

      server = {
        DOMAIN = "git.tuhana.me";
        DISABLE_SSH = true;
      };

      service = { DISABLE_REGISTRATION = true; };
    };
  };
}
