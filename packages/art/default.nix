{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      inkscape
      krita
    ];
  };
}
