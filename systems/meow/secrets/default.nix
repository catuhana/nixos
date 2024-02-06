{ lib, config, ... }:
let
  cloudflaredCfg = config.services.cloudflared;

  forgejoCfg = config.services.forgejo;
  vaultwardenCfg = config.services.vaultwarden;
in
{
  sops.defaultSopsFile = ./secrets.yaml;

  sops.secrets."users/meow/password" = {
    neededForUsers = true;
  };

  sops.secrets."services/main/cloudflared/connector-token" = lib.mkIf cloudflaredCfg.enable {
    owner = cloudflaredCfg.user;
    group = cloudflaredCfg.group;
  };

  sops.secrets."services/self-hosted/forgejo/gitea-actions-runner/registration-token" = lib.mkIf forgejoCfg.enable { };
  sops.secrets."services/self-hosted/vaultwarden/admin-token" = lib.mkIf vaultwardenCfg.enable { };
}
