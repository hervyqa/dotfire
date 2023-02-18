{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    dconf = {
      enable = true;
    };
  };
}
