{
  description =
    "Unified configuration for my server and probably my desktops too.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = { self, nixpkgs, agenix, ... }@inputs: {
    nixosConfigurations = {
      "meow" = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";

        specialArgs = { inherit inputs; };

        modules = [
          ./meow/default.nix
          ./config.nix
          agenix.nixosModules.default
          {
            environment.systemPackages = [
              agenix.packages.${system}.default
            ]
          }
        ];
      };
    };
  };
}
