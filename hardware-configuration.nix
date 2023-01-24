# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [
        "ahci"
        "ehci_pci"
        "sd_mod"
        "uas"
        "usb_storage"
        "usbhid"
        "xhci_pci"
      ];
      kernelModules = [
        "amdgpu"
      ];
      luks.devices = {
        "luks-832b5bb1-889c-407d-972a-db398eab8c59" = {
          device = "/dev/disk/by-uuid/832b5bb1-889c-407d-972a-db398eab8c59";
        };
      };
    };
    kernelModules = [
      "kvm-amd"
    ];
    extraModulePackages = [];
  };

  fileSystems = {
    "/boot/efi" = {
      device = "/dev/disk/by-uuid/686D-6983";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-uuid/9395a257-5640-493e-acf9-dcb11761f052";
      fsType = "ext4";
    };
  };

  swapDevices = [];

  networking = {
    useDHCP = lib.mkDefault true;
    interfaces = {
      # eno1.useDHCP = lib.mkDefault true;
      # wlp3s0.useDHCP = lib.mkDefault true;
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
