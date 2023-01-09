{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cnijfilter2
    discord
    zoom
  ];
}
