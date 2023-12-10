{ pkgs, inputs, ... }: {
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs;
    [ git inputs.agenix.packages.aarch64-linux.default ];
}
