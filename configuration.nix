{
  config,
  pkgs,
  libs,
  ...
}: let
  name = "hervyqa";
  fullname = "Hervy Qurrotul Ainur Rozi";
  email = "hervyqa@proton.me";
  timezone = "Asia/Jakarta";
  defaultlocale = "en_US.UTF-8";
  extralocale = "id_ID.UTF-8";
  layout = "us";
  gpgkey = "85161EB8";
  hostname = "nixos";
  version = "22.11";
in {
  imports = [
    ./hardware.nix
  ];

  # Bootloader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        useOSProber = false; # true: If dual boot.
        splashImage = null;
      };
      timeout = 2;
    };
    initrd.secrets = {
      "/crypto_keyfile.bin" = null;
    };
    kernel = {
      sysctl = {
        "vm.swappiness" = 60;
      };
    };
    tmpOnTmpfs = true;
  };

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

  # Set your time zone
  time.timeZone = "${timezone}";

  # Select internationalisation properties
  i18n = {
    defaultLocale = "${defaultlocale}";
    extraLocaleSettings = {
      LC_ADDRESS = "${extralocale}";
      LC_IDENTIFICATION = "${extralocale}";
      LC_MEASUREMENT = "${extralocale}";
      LC_MONETARY = "${extralocale}";
      LC_NAME = "${extralocale}";
      LC_NUMERIC = "${extralocale}";
      LC_PAPER = "${extralocale}";
      LC_TELEPHONE = "${extralocale}";
      LC_TIME = "${extralocale}";
    };
  };

  # Define a user account
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

  # Nix settings
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      trusted-users = ["root" "${name}"];
    };
  };

  # Nixpkgs config
  nixpkgs = {
    config = {
      allowUnfree = true;
      # firefox = {
      #   enablePlasmaBrowserIntegration = false;
      # };
    };
  };

  # Fonts
  fonts = {
    fonts = with pkgs; [
      fira
      fira-code
      font-awesome
      ibm-plex
      jetbrains-mono
      source-han-sans
    ];
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Source Han Serif"];
      sansSerif = ["Noto Sans" "Source Han Sans"];
    };
  };

  qt5.platformTheme = "kde"; # lxqt/kde

  # Packages
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
    };

    systemPackages = with pkgs;
    with libsForQt5;
    with nodePackages; [
    ];
  };

  # Zram swap
  zramSwap = {
    enable = true;
    algorithm = "zstd"; # default
  };

  # Programs
  programs = {
    adb.enable = true;
    dconf.enable = true;
    gamemode.enable = true;
    mtr.enable = true;
    partition-manager.enable = true;
    command-not-found.enable = false;

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };

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

  # Services
  services = {
    dbus = {
      enable = true;
    };

    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        ipv6_servers = true;
        require_dnssec = true;
      };
    };

    earlyoom = {
      enable = true;
      freeMemThreshold = 5;
    };

    fstrim = {
      enable = true;
    };

    mongodb = {
      enable = true;
    };

    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = false;
      media-session.enable = false;
      pulse.enable = true;
    };

    power-profiles-daemon = {
      enable = true;
    };

    postgresql = {
      enable = true;
    };

    printing = {
      enable = true;
      stateless = true;
      webInterface = false;
    };

    thermald = {
      enable = true;
    };

    tlp = {
      enable = false;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 50;
      };
    };

    udisks2 = {
      enable = true;
    };

    xserver = {
      enable = true;
      desktopManager = {
        lxqt = {
          enable = false;
        };
        plasma5 = {
          enable = true;
          excludePackages = with pkgs.libsForQt5; [
            oxygen
            plasma-browser-integration
          ];
        };
        xterm.enable = false;
      };
      displayManager = {
        defaultSession = "plasma"; # lxqt/plasma/plasmawayland
        sddm = {
          # for lxqt/plasma
          enable = true;
          autoNumlock = true;
          settings = {
            Theme = {
              CursorTheme = "breeze_cursors";
            };
          };
        };
        autoLogin = {
          enable = true;
          user = "${name}";
        };
      };
      excludePackages = with pkgs; [
        xterm
      ];
      layout = "${layout}";
      libinput = {
        enable = true;
        touchpad = {
          disableWhileTyping = true;
          sendEventsMode = "disabled-on-external-mouse";
        };
      };
      videoDrivers = ["amdgpu"];
      wacom = {
        enable = true;
      };
      xkbVariant = "";
    };
  };

  # Hardware
  sound.enable = true;
  hardware = {
    pulseaudio = {
      enable = false;
    };
    bluetooth = {
      enable = true;
    };
    opengl = {
      driSupport = true;
      extraPackages = with pkgs; [
        amdvlk
      ];
    };
  };

  # Power Management
  powerManagement = {
    enable = true;
    powertop = {
      enable = false;
    };
  };

  # Systemd
  systemd = {
    oomd = {
      enable = false; # switch to earlyoom
    };
  };

  # Security
  security = {
    rtkit = {
      enable = true;
    };
    pam.services.kwallet = {
      name = "kwallet";
      enableKwallet = true;
    };
    sudo = {
      enable = false;
      wheelNeedsPassword = false;
    };
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["root"];
          groups = ["wheel"];
          keepEnv = true;
          persist = true;
        }
      ];
      wheelNeedsPassword = false;
    };
  };

  # Firewall
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

  # System
  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = false;
    };
    stateVersion = "${version}";
  };
}
