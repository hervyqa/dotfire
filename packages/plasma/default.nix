{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs;
    with libsForQt5; [
      ark
      kate
      kcolorpicker
      kgpg
      krename
      kteatime
      ktouch
      quazip
      rsibreak
    ];
  };
}
