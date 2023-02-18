{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    adb = {
      enable = true;
    };
  };
}
