{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
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
    kernelPackages = pkgs.linuxPackages_xanmod;
    plymouth = {
      enable = true;
    };
    extraModulePackages = [];
  };
}
