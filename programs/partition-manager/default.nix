{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    partition-manager = {
      enable = true;
    };
  };
}
