{ lib, config, ... }:
let
  forgejoCfg = config.services.forgejo;
  vaultwardenCfg = config.services.vaultwarden;
in
{
  sops.defaultSopsFile = ./secrets.yaml;

  sops.secrets."users/meow/password" = {
    neededForUsers = true;
  };

  sops.secrets."services/self-hosted/forgejo/gitea-actions-runner/registration-token" = lib.mkIf forgejoCfg.enable { };
  sops.secrets."services/self-hosted/vaultwarden/admin-token" = lib.mkIf vaultwardenCfg.enable { };
}
