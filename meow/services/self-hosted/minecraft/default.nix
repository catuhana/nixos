{ ... }: {
  services.minecraft-server = {
    enable = true;

    eula = true;
    declarative = true;

    jvmOpts = "-XX:+UseG1GC -Xmx4G -Xms4G -Dsun.rmi.dgc.server.gcInterval=2147483646 -XX:+UnlockExperimentalVMOptions -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M";

    serverProperties = {
      level-name = "242";
      online-mode = false;
      max-players = 5;

      view-distance = 12;
      simulation-distance = 12;

      gamemode = "survival";
      difficulty = "hard";

      motd = "Oda 242";
    };
  };
}
