{
  config,
  pkgs,
  libs,
  ...
}: {
  networking = {
    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764; # kdeconnect
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764; # kdeconnect
        }
      ];
    };
  };
}
