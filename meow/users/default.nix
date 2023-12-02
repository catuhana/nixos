{ pkgs, ... }: {
  imports = [ ./meow ];

  users = { defaultUserShell = pkgs.zsh; };
}
