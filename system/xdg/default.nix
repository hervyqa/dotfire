{
  config,
  pkgs,
  libs,
  ...
}: {
  xdg = {
    portal = {
      enable = true;
      lxqt = {
        enable = false;
        styles = [
          pkgs.libsForQt5.qtstyleplugin-kvantum
          pkgs.breeze-qt5
          pkgs.qtcurve
        ];
      };
      wlr = {
        enable = true;
      };
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];
    };
  };
}
