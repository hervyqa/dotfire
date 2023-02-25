{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs;
    with libsForQt5; [
      ark
      dragon
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
