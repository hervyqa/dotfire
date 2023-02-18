{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    kdeconnect = {
      enable = true;
    };
  };
}
