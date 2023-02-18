{
  config,
  pkgs,
  libs,
  ...
}: {
  zramSwap = {
    enable = true;
    algorithm = "zstd"; # default
  };
}
