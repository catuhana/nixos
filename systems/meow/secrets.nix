{ config, lib, ... }:
let
  forgejoCfg = config.services.forgejo;
  vaultwardenCfg = config.services.vaultwarden;

  meow =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINa12N6GqzfFRh3L02trgWa4ffRzSIWZljce419o57Jp meow@NixOS";
  system =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOIZ2jEFlMcj1Oum35E9GUQbchTeWwHFePDwwX0VGqck root@NixOS";
in
{
  "./users/meow/password.age".publicKeys = [ meow system ];

  "./services/self-hosted/forgejo/gitea-actions-runner.token.age".publicKeys = lib.mkIf forgejoCfg.enable [ meow system ];
  "./services/self-hosted/vaultwarden/admin.token.age".publicKeys = lib.mkIf vaultwardenCfg.enable [ meow system ];
}
