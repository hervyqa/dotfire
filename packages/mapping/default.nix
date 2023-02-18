{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs;
    with libsForQt5; [
      heimer
      umbrello
      vym
    ];
  };
}
