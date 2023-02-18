{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    dbus = {
      enable = true;
    };
  };
}
