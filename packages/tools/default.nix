{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      usbimager
    ];
  };
}
