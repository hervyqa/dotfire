{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    mongodb = {
      enable = true;
    };
  };
}
