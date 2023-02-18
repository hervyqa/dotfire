{
  config,
  pkgs,
  libs,
  ...
}: {
  hardware = {
    bluetooth = {
      enable = true;
    };
  };
}
