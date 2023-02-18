{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    fstrim = {
      enable = true;
    };
  };
}
