{ lib, ... }: {
  networking = {
    hostName = "meow";
    useNetworkd = true;

    dhcpcd.enable = false;

    firewall.allowedTCPPorts = [ 22 80 443 22067 22070 25565 19132 ];
    firewall.allowedUDPPorts = [ 443 25565 19132 ];

    nameservers = [ "1.1.1.1" "1.0.0.1" ];
  };

  systemd.network = {
    enable = true;

    networks."10-wan" = {
      matchConfig.name = "enp1s0";
      networkConfig.DHCP = "ipv4";

      address = [ "2a01:4f8:c012:c8b9::/64" ];
      routes = [{ routeConfig.Gateway = "fe80::1"; }];
    };
  };
}
