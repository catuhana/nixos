{ config, ... }: {
  age.secrets = {
    "users.meow.password" = {
      file = ./users/meow/password.age;
    };

    "services.self-hosted.forgejo.gitea-actions-runner.token" = {
      file = ./services/self-hosted/forgejo/gitea-actions-runner.token.age;
      owner = "forgejo";
      group = "forgejo";
    };

    "services.self-hosted.vaultwarden.admin.token" = {
      file = ./services/self-hosted/vaultwarden/admin.token.age;
      owner = "vaultwarden";
      group = "vaultwarden";
    };
  };
}
