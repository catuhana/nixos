{ pkgs, config, ... }: {
  users = {
    users.meow = {
      isNormalUser = true;
      description = "tuhana";
      passwordFile = config.age.secrets.meow-password.path;
      extraGroups = [ "wheel" ];

      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO8RwSEXA/fNU28BbhSPeAT/i6HWmsd+jQLYdJLPXLZI ssh@tuhana.me"
      ];
    };
  };
}
