{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    initrd.availableKernelModules =
      [ "virtio_net" "virtio_pci" "virtio_mmio" "virtio_blk" "virtio_scsi" "xhci_pci" "9p" "9pnet_virtio" ];
    initrd.kernelModules = [ "virtio_balloon" "virtio_console" "virtio_rng" ];
    tmp.cleanOnBoot = true;

    kernel.sysctl = { "net.ipv4.tcp_fastopen" = 3; };

    loader = {
      timeout = 0;

      efi.canTouchEfiVariables = true;

      systemd-boot = { enable = true; };
    };
  };
}
