{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    command-not-found = {
      enable = false;
    };
  };
}
