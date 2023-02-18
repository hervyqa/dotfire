{config, ...}: {
  imports = [
    ./bluetooth
    ./boot
    ./env
    ./firewall
    ./fonts
    ./locale
    ./mime
    ./network
    ./nix
    ./opengl
    ./power
    ./security
    ./sound
    ./system
    ./systemd
    ./timezone
    ./users
    ./xdg
    ./zram
  ];
}
