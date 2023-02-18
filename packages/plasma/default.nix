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
      kgpg
      krename
      kteatime
      ktouch
      quazip
      rsibreak
    ];
  };
}
