{
  config,
  pkgs,
  libs,
  ...
}: let
  version = "22.11";
in {
  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = false;
    };
    stateVersion = "${version}";
  };
}
