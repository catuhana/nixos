{ pkgs, ... }: {
  services.minecraft-server = {
    enable = true;

    package = pkgs.papermc;

    eula = true;
    declarative = true;

    jvmOpts = "-Xms4096M -Xmx4096M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20";

    whitelist = {
      catuhana = "46854c64-da1e-3955-bf52-6b9eca8aec41";
      ErenAlp3455 = "952f18cc-ce09-37f3-99e8-176d7502ad85";
      qPANGEAp = "3d7153bb-de64-3b09-830b-987bf69dbba1";
      yasins = "be20e18d-af06-3324-9f56-711be5463212";
    };

    serverProperties = {
      level-name = "242";
      online-mode = false;
      max-players = 5;

      sync-chunk-writes = false;
      view-distance = 12;
      simulation-distance = 12;

      gamemode = "survival";
      difficulty = "normal";

      motd = "\\u00a75Oda \\u00a7d\\u00a7l\\u00a7n242";

      white-list = true;
    };
  };
}
