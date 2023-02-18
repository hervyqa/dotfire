{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      keepassxc
      media-downloader
      tdesktop
    ];
  };
}
