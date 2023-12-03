{ config, ... }: {
  age.secrets = {
    "users.meow.password" = {
      file = ./users/meow/password.age;
    };

    "services.self-hosted.forgejo.gitea-actions-runner.token" = {
      file = ./services/self-hosted/forgejo/gitea-actions-runner.token.age;
    };

    "services.self-hosted.vaultwarden.admin.token" = {
      file = ./services/self-hosted/vaultwarden/admin.token.age;
    };
  };
}
