{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    java = {
      enable = true;
    };
  };
}
