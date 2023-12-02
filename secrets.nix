{ config, ... }: {
  age.secrets = {
    "users.meow.password" = {
      file = ./secrets/users/meow/password.age;
      owner = "meow";
    };

    "self-hosted.forgejo.gitea-actions-runner.token" = {
      file = ./secrets/self-hosted/forgejo/gitea-actions-runner.token.age;
    };
  };
}
