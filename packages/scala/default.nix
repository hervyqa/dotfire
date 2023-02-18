{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      scala
      metals
    ];
  };
}
