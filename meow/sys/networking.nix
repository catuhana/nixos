{ lib, ... }: {
  networking = {
    hostName = "NixOS";

    dhcpcd.enable = false;

    nameservers = [ "1.1.1.1" "1.0.0.1" ]

      systemd.network {
        enable = true;

        networks."10-wan" = {
          DHCP = "ipv4";

          matchConfig.name = "enp1s0";

          address = [ "2a01:4f8:c012:c8b9::/64" ];

          routes = [{ routeConfig.Gateway = "fe80::1"; }];
        };
      };
  };
}
