{
  config,
  pkgs,
  libs,
  ...
}: {
  powerManagement = {
    enable = true;
    powertop = {
      enable = false;
    };
  };
}
