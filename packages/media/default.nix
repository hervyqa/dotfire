{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs;
    with libsForQt5; [
      audacity
      kdenlive
      obs-studio
      v4l-utils
      vokoscreen
    ];
  };
}
