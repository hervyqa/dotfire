{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      libreoffice
      libreoffice-qt
      zotero
    ];
  };
}
