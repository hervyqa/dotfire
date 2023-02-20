{
  config,
  pkgs,
  libs,
  ...
}: {
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };
}
