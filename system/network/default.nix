{
  config,
  pkgs,
  libs,
  ...
}: let
  hostname = "nixos";
in {
  networking = {
    hostName = "${hostname}";
    networkmanager = {
      enable = true; # Enables via NetworkManager.
    };
    wireless = {
      enable = false; # Enables via wpa_supplicant.
    };
    wireless.iwd = {
      enable = false; # Enables via iwd.
      settings = {
        Network = {
          EnableIPv6 = true;
          RoutePriorityOffset = 300;
        };
        Settings = {
          AutoConnect = true;
        };
      };
    };
    ## Configure network proxy if necessary.
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };
}
