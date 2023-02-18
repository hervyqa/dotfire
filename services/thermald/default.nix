{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    thermald = {
      enable = true;
    };
  };
}
