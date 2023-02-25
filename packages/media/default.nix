{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      audacity
      obs-studio
      v4l-utils
      vokoscreen
    ];
  };
}
