{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    discord
    zoom-us
  ];
}
