{ config, lib, ... }: {
  services."caddy" = {
    enable = true;

    email = "acme@tuhana.me";

    logFormat = lib.mkForce ''
      level INFO
      format console
    '';
  };
}
