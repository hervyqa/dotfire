{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    mtr = {
      enable = true;
    };
  };
}
