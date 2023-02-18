{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    power-profiles-daemon = {
      enable = true;
    };
  };
}
