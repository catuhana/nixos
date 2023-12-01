{ pkgs, ... }: {
  imports = [ ./meow.nix ];

  users = {
    defaultUserShell = pkgs.zsh;
  };
}
