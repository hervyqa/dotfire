{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    earlyoom = {
      enable = true;
      freeMemThreshold = 5;
    };
  };
}
