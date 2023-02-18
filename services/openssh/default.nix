{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    openssh = {
      enable = false;
    };
  };
}
