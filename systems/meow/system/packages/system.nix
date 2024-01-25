{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ git inputs.agenix.packages.aarch64-linux.default ];
}
