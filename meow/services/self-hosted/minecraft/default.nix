{ ... }: {
  services.minecraft-server = {
    enable = true;

    eula = true;
    declarative = true;

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
