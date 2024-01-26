{ inputs, config, pkgs, ... }:
let
  cfg = config.services.minecraft-servers;
in
{
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
  ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;

    eula = true;
    openFirewall = true;

    dataDir = "/var/lib/minecraft";

    servers.o242 = {
      enable = true;

      package = pkgs.fabricServers.fabric-1_20_4;

      jvmOpts = "-Xms4096M -Xmx4096M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20";

      whitelist = {
        catuhana = "46854c64-da1e-3955-bf52-6b9eca8aec41";
        IBullseyea04 = "ae3031b7-e4e8-30f9-88fe-1be2fb5aecc8";
        qPANGEAp = "3d7153bb-de64-3b09-830b-987bf69dbba1";
        yasins = "be20e18d-af06-3324-9f56-711be5463212";
      };

      serverProperties = {
        online-mode = false;
        max-players = 5;
        pvp = false;

        sync-chunk-writes = false;
        view-distance = 12;
        simulation-distance = 12;

        gamemode = "survival";
        difficulty = "normal";

        motd = "\\u00a75Oda \\u00a7d\\u00a7l\\u00a7n242";

        white-list = true;
      };

      symlinks = {
        mods = with pkgs; pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
          FabricAPI = fetchurl
            {
              url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/TvatZFJI/fabric-api-0.95.1%2B1.20.4.jar";
              hash = "sha256-y56ykynKMvegXlCUpmITPsmrtOoaXDMwGeEM3vojsDc=";
            };

          Lithium = fetchurl
            {
              url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/nMhjKWVE/lithium-fabric-mc1.20.4-0.12.1.jar";
              hash = "sha256-as1JWV7mnhJkz8eYmPVpRS5BvWaYVGf8s40oBBka880=";
            };

          Starlight = fetchurl
            {
              url = "https://cdn.modrinth.com/data/H8CaAYZC/versions/HZYU0kdg/starlight-1.1.3%2Bfabric.f5dcd1a.jar";
              hash = "sha256-vfOj8cRwiU2NJHJsEuieswnHxG2G/4UnSQxc5btnuYk=";
            };

          FerriteCore = fetchurl {
            url = "https://cdn.modrinth.com/data/uXXizFIs/versions/pguEMpy9/ferritecore-6.0.3-fabric.jar";
            hash = "sha256-ZphO6VxKsFqDxDew3QRWikosjn8hm3SYYE4llSxMwSU=";
          };

          MemoryLeakFix = fetchurl
            {
              url = "https://cdn.modrinth.com/data/NRjRiSSD/versions/5xvCCRjJ/memoryleakfix-fabric-1.17%2B-1.1.5.jar";
              hash = "sha256-uKwz1yYuAZcQ3SXkVBFmFrye0fcU7ZEFlLKKTB2lrd4=";
            };

          FallingTree = fetchurl {
            url = "https://cdn.modrinth.com/data/Fb4jn8m6/versions/mb15RrXi/FallingTree-1.20.4-1.20.4.3.jar";
            hash = "sha256-F1f4uKECYVrGA0G4VYVwFP45ykkwHi+Vx4BeFNiyuiQ=";
          };

          SpawnAnimations = fetchurl {
            url = "https://cdn.modrinth.com/data/zrzYrlm0/versions/pQ0HEnlC/spawnanimations-v1.9.4-mc1.17x-1.20x-mod.jar";
            hash = "sha256-aptq6xbbJND12MqQdF3plJhZTpTbfmYUIO/vE1MEAps=";
          };

          DynamicLights = fetchurl {
            url = "https://cdn.modrinth.com/data/7YjclEGc/versions/Y1UP7YoY/dynamiclights-v1.7.1-mc1.17x-1.20x-mod.jar";
            hash = "sha256-3tqON+EDyaLrJJ4zEMBt/jX53Sg9vAJceGoJUvq3QKQ=";
          };

          FabricTailor = fetchurl {
            url = "https://cdn.modrinth.com/data/g8w1NapE/versions/fnrwvBbP/fabrictailor-2.3.0.jar";
            hash = "sha256-OLNrP8kHk9lZ+tGrq7xsgr1vIG92vvMiQkrGIpA0fbM=";
          };

          TabTPS = fetchurl {
            url = "https://cdn.modrinth.com/data/cUhi3iB2/versions/rCWKatYi/tabtps-fabric-mc1.20.4-1.3.22.jar";
            hash = "sha256-Ws8NwvtKeMo2PCdnukti45apsDBNnhzXwebn4CR3OWw=";
          };

          SharedEnderChest = fetchurl {
            url = "https://mediafilez.forgecdn.net/files/5009/266/shared-echest-1.0.2.jar";
            hash = "sha256-TCHDvURO9Eod39e9e1oSTDW1R1gDSqt4cZB4dtkhTjg=";
          };

          Trinkets = fetchurl {
            url = "https://cdn.modrinth.com/data/5aaWibi9/versions/tJ23Vcff/trinkets-3.8.0.jar";
            hash = "sha256-rAb9xuf4WKTVNShkelTMyhDh1UvF9RDcDagk8JW1S8w=";
          };

          ElytraTrinket = fetchurl {
            url = "https://cdn.modrinth.com/data/wk57PrDM/versions/HOR880FC/elytra_trinket-1.0.5.jar";
            hash = "sha256-GjIpvrH8rIsaNN7QX4nFHopT11rykg0S5PrJ+Dxt/S8=";
          };
        });
      };
    };
  };
}
