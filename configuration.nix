{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./python.nix
    ./r.nix
    ./neovim.nix
    # ./vim.nix
    # ./vscodium.nix
  ];

  # Allow proprietary software (such as the NVIDIA drivers).
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "id_ID.UTF-8";
    LC_IDENTIFICATION = "id_ID.UTF-8";
    LC_MEASUREMENT = "id_ID.UTF-8";
    LC_MONETARY = "id_ID.UTF-8";
    LC_NAME = "id_ID.UTF-8";
    LC_NUMERIC = "id_ID.UTF-8";
    LC_PAPER = "id_ID.UTF-8";
    LC_TELEPHONE = "id_ID.UTF-8";
    LC_TIME = "id_ID.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.displayManager.gdm.wayland = false;

  # Window Managers
  services.xserver.windowManager.stumpwm.enable = false;
  services.xserver.windowManager.ratpoison.enable = false;
  services.xserver.windowManager.exwm.enable = false;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # Media session
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hervyqa = {
    isNormalUser = true;
    description = "Hervy Qurrotul Ainur Rozi";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [
      kate
    ];
  };

  # VS Code under Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # data science
    R
    clickhouse
    datasette
    dbeaver
    duckdb
    gnuplot
    grafana
    julia
    kaggle
    luigi
    metabase
    paraview
    sqlitebrowser
    tabula
    visidata
    wxmaxima

    # scala
    scala

    # rakudo
    rakudo

    # node
    nodejs
    yarn

    # IDE
    rstudio # R
    spyder # python
    vscodium # general

    # python packages
    codebraid
    conda
    jupyter
    python3Full

    # devops
    apache-airflow
    hadoop
    kafkactl
    mariadb
    mongodb
    postgresql
    spark
    sqlite
    sqlite-utils

    # cli packages
    bottom
    direnv
    dnscrypt-proxy2
    earlyoom
    efibootmgr
    exa
    fish
    git
    gitui
    home-manager
    htop
    inxi
    macchina
    neovim
    nixos-option
    ranger
    tmux
    translate-shell
    wget

    # kde plasma
    kfind
    libsForQt5.applet-window-buttons
    libsForQt5.kdeconnect-kde
    libsForQt5.ktouch
    libsForQt5.sddm-kcm
    wacomtablet

    # browser
    librewolf

    # design
    gimp
    inkscape
    krita

    # multimedia
    carla
    qpwgraph
    vlc
    vokoscreen

    # productivity
    libreoffice
    libreoffice-qt

    # communication
    tdesktop
    discord

    # theme
    lxappearance
    papirus-icon-theme

    # printer driver
    epson-escpr
    epson-escpr2
    foomatic-db
    foomatic-filters

    # fonts
    google-fonts
    font-awesome
  ];

  # Shell
  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --show-trace";
      clean = "sudo nix-store --gc";
      disk = "lsblk -o name,fstype,fsavail,fsused,fsuse%,size,label,mountpoint";
      la = "ls -lha";
      ll = "ls -lh";
      sysinfo = "nix-shell -p nix-info --run 'nix-info -m'";
      search = "nix-env -qaP";
    };
  };

  # Dconf for gtk theme
  programs.dconf.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;
    };
  };

  # Enable Earlyoom
  services.earlyoom.enable = true;

  # Enable Mariadb (mysql)
  services.mysql.package = pkgs.mariadb;
  services.mysql.enable = false;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # System upgrade
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  system.stateVersion = "22.11";
}
