{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  networking = {
    useDHCP = lib.mkDefault true;
    interfaces = {
      # eno1.useDHCP = lib.mkDefault true;
      # wlp3s0.useDHCP = lib.mkDefault true;
    };
  };
}
