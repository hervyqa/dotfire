{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    droidcam = {
      enable = true;
    };
  };
}
