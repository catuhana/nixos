{ config, ... }: {
  age.secrets = {
    "users.meow.password" = {
      file = ./users/meow/password.age;
      owner = "meow";
    };

    "self-hosted.forgejo.gitea-actions-runner.token" = {
      file = ./services/self-hosted/forgejo/gitea-actions-runner.token.age;
    };
  };
}