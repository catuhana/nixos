{ pkgs, ... }: {
  imports = [
    ./meow.nix
    ./root.nix
  ];

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
  };
}
