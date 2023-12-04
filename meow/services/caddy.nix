{ config, ... }: {
  services."caddy" = {
    enable = true;

    email = "acme@tuhana.me";
  };
}
