{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./boot
    ./filesystem
    ./hardware
    ./networking
    ./platform
    ./swapdevices
  ];
}
