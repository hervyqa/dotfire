{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      papirus-icon-theme
      themechanger
    ];
  };
}
