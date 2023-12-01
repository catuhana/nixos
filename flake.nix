{
  description =
    "Unified configuration for my server and probably my desktops too.";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      "meow" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";

        specialArgs = { inherit inputs; };

        modules = [ ./meow/config.nix ./config.nix ];
      };
    };
  };
}
