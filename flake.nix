{
  description = "Unified configuration for my server and probably my desktops too.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    sops-nix = {
      url = "github:Mic92/sops-nix";

      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
  };

  outputs = inputs@{ self, nixpkgs, sops-nix, ... }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [ git github-cli nixpkgs-fmt vim tmux ];
        };
      });

      nixosConfigurations = {
        "meow" = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";

          specialArgs = { inherit inputs; };

          modules = [
            ./systems

            ./config.nix

            sops-nix.nixosModules.sops
          ];
        };
      };
    };
}
