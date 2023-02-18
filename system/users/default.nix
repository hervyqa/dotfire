{
  config,
  pkgs,
  libs,
  ...
}: let
  name = "hervyqa";
  fullname = "Hervy Qurrotul Ainur Rozi";
in {
  users = {
    defaultUserShell = pkgs.fish;
    users.${name} = {
      isNormalUser = true;
      description = "${fullname}";
      extraGroups = [
        "adbusers"
        "audio"
        "disk"
        "input"
        "lp"
        "mysql"
        "network"
        "networkmanager"
        "power"
        "scanner"
        "sound"
        "systemd-journal"
        "users"
        "video"
        "wheel"
      ];
    };
  };
}
