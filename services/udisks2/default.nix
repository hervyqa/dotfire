{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    udisks2 = {
      enable = true;
    };
  };
}
