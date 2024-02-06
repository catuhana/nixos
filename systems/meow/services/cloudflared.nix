{ config, ... }:
let
  cfg = config.services.cloudflared;
in
{
  services.cloudflared = {
    enable = false;

    tunnels.meow = {
      default = "http_status:404";

      credentialsFile = config.sops.secrets."services/main/cloudflared/connector-token".path;

      ingress = {
        "ssh.tuhana.me".service = "ssh://localhost:22";
      };
    };
  };
}
