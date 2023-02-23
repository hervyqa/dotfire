{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    corectrl = {
      enable = true;
    };
  };
}
