{ config, pkgs, lib, ... }:
let
  cfg = config.services.minecraft-server;
in
{
  services.minecraft-server = {
    enable = true;

    package = pkgs.papermc;

    eula = true;
    declarative = true;

    jvmOpts = "-Xms4096M -Xmx4096M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20";

    whitelist = {
      catuhana = "46854c64-da1e-3955-bf52-6b9eca8aec41";
      IBullseyea04 = "ae3031b7-e4e8-30f9-88fe-1be2fb5aecc8";
      qPANGEAp = "3d7153bb-de64-3b09-830b-987bf69dbba1";
      yasins = "be20e18d-af06-3324-9f56-711be5463212";
    };

    serverProperties = {
      level-name = "242";

      online-mode = false;
      max-players = 5;
      pvp = false;

      sync-chunk-writes = false;
      view-distance = 32;
      simulation-distance = 16;

      gamemode = "survival";
      difficulty = "normal";

      motd = "\\u00a75Oda \\u00a7d\\u00a7l\\u00a7n242";

      white-list = true;
    };
  };

  networking.firewall = lib.mkIf cfg.enable {
    allowedTCPPorts = [ 25565 19132 ];
    allowedUDPPorts = [ 25565 19132 ];
  };
}
