{
  description = "Unified configuration for my server and probably my desktops too.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
  };

  outputs = inputs@{ self, nixpkgs, agenix, ... }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [ git github-cli vim nixpkgs-fmt ];
        };
      });

      nixosConfigurations = {
        "meow" = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";

          specialArgs = { inherit inputs; };

          modules = [
            ./meow

            ./config.nix

            agenix.nixosModules.default

            (args: {
              nixpkgs.overlays = [
                (import ./meow/overlays/papermc.nix)
              ];
            })
          ];
        };
      };
    };
}
