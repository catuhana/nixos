{ config, lib, ... }:
let
  forgejoCfg = config.services.forgejo;
  vaultwardenCfg = config.services.vaultwarden;
in
{
  age.secrets = {
    "users.meow.password" = {
      file = ./users/meow/password.age;
      owner = "meow";
    };

    "services.self-hosted.forgejo.gitea-actions-runner.token" = lib.mkIf forgejoCfg.enable {
      file = ./services/self-hosted/forgejo/gitea-actions-runner.token.age;
      owner = "forgejo";
      group = "forgejo";
    };

    "services.self-hosted.vaultwarden.admin.token" = lib.mkIf vaultwardenCfg.enable {
      file = ./services/self-hosted/vaultwarden/admin.token.age;
      owner = "vaultwarden";
      group = "vaultwarden";
    };
  };
}