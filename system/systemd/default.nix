{
  config,
  pkgs,
  libs,
  ...
}: {
  systemd = {
    oomd = {
      enable = false; # switch to earlyoom
    };
  };
}
