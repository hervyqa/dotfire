{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      rakudo
    ];
  };
}
