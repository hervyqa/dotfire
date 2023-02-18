{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
  };
}
