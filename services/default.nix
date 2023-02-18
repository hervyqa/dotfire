{config, ...}: {
  imports = [
    ./dbus
    ./dnscrypt-proxy2
    ./earlyoom
    ./fstrim
    ./mariadb
    ./mongodb
    ./openssh
    ./pipewire
    ./postgresql
    ./power-profiles-daemon
    ./printing
    ./thermald
    ./tlp
    ./udisks2
    ./xserver
  ];
}
