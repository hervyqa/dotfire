{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    # ./nonfree.nix
    # ./neovim.nix
    # ./python-pkgs.nix
    # ./r-pkgs.nix
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
    duckdb
    gnuplot
    grafana
    kaggle
    luigi
    metabase
    paraview
    rstudioWrapper
    tabula
    visidata
    wxmaxima

    # julia
    julia

    # scala
    scala

    # rakudo
    rakudo

    # node
    nodejs
    yarn

    # IDE
    dbeaver # database
    rstudio # R
    spyder # python
    sqlitebrowser # sqlite
    texstudio # latex
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
    disfetch
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
    joshuto
    neovim
    nixos-option
    texlab
    tmux
    translate-shell
    wget

    # kde plasma
    libsForQt5.kdeconnect-kde
    libsForQt5.ktouch
    libsForQt5.sddm-kcm
    wacomtablet

    # browser
    firefox

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

    # nonfree
    discord
    zoom-us

    # python packages
    (python310.withPackages(ps: with ps; [
      altair
      beautifulsoup4
      bokeh
      catboost
      google-cloud-bigquery
      ibm-watson
      ipykernel
      ipython
      jedi
      jedi-language-server
      jupyterhub
      jupyterlab
      keras
      lightgbm
      matplotlib
      mayavi
      networkx
      nltk
      numpy
      pandas
      pip
      plotly
      plotnine
      pyls-spyder
      pynvim
      pyzmq
      requests
      scikit-learn
      scipy
      seaborn
      spyder
      spyder-kernels
      statsmodels
      tableaudocumentapi
      tensorflow
      tensorflow-metadata
      tensorflow-probability
      trfl
      virtualenv
      virtualenvwrapper
      #torch
      #torchaudio-bin
      #torchvision
    ]))

    # neovim packages
    (neovim.override {
      withNodeJs = true;
      vimAlias = true;
      configure = {
        packages.myPlugins = with pkgs.vimPlugins; {
          start = [
            coc-clangd
            coc-clap
            coc-cmake
            coc-css
            coc-denite
            coc-diagnostic
            coc-docker
            coc-emmet
            coc-eslint
            coc-explorer
            coc-flutter
            coc-fzf
            coc-git
            coc-go
            coc-haxe
            coc-highlight
            coc-html
            coc-java
            coc-jest
            coc-json
            coc-lists
            coc-lua
            coc-markdownlint
            coc-metals
            coc-neco
            coc-nginx
            coc-nvim
            coc-pairs
            coc-prettier
            coc-pyright
            coc-python
            coc-r-lsp
            coc-rls
            coc-rust-analyzer
            coc-sh
            coc-smartf
            coc-snippets
            coc-solargraph
            coc-spell-checker
            coc-sqlfluff
            coc-stylelint
            coc-sumneko-lua
            coc-svelte
            coc-tabnine
            coc-tailwindcss
            coc-texlab
            coc-toml
            coc-tslint
            coc-tslint-plugin
            coc-tsserver
            coc-ultisnips
            coc-vetur
            coc-vimlsp
            coc-vimtex
            coc-wxml
            coc-yaml
            coc-yank
            scope-nvim
            scrollbar-nvim
            statix
            surround-nvim
            tabline-nvim
            vim-airline
            vim-airline-themes
            vim-commentary
            vim-lastplace
            vim-lightline-coc
            vim-nix
          ];
          opt = [];
        };
        customRC = ''
          filetype indent on
          filetype on
          set backspace=indent,eol,start
          set expandtab
          set history=1000
          set hlsearch
          set ignorecase
          set incsearch
          set linebreak breakindent
          set list listchars=tab:>>,trail:~
          set nobackup
          set nocompatible
          set nowrap
          set nomodified
          set number relativenumber
          set scrolloff=10
          set shiftwidth=2
          set showcmd
          set showmatch
          set showmode
          set smartcase
          set smarttab
          set splitbelow
          set splitright
          set t_Co=256
          set tabstop=2
          set undofile
          set undolevels=50000
          set updatetime=100
          syntax on

          let g:mapleader = "\<Space>"

          tnoremap <Esc> <C-\><C-n>
          tnoremap <A-h> <C-\><C-N><C-w>h
          tnoremap <A-j> <C-\><C-N><C-w>j
          tnoremap <A-k> <C-\><C-N><C-w>k
          tnoremap <A-l> <C-\><C-N><C-w>l
          inoremap <A-h> <C-\><C-N><C-w>h
          inoremap <A-j> <C-\><C-N><C-w>j
          inoremap <A-k> <C-\><C-N><C-w>k
          inoremap <A-l> <C-\><C-N><C-w>l
          nnoremap <A-h> <C-w>h
          nnoremap <A-j> <C-w>j
          nnoremap <A-k> <C-w>k
          nnoremap <A-l> <C-w>l

          nnoremap <silent> <Left> :vertical resize +2<CR>
          nnoremap <silent> <Right> :vertical resize -2<CR>
          nnoremap <silent> <Up> :resize +2<CR>
          nnoremap <silent> <Down> :resize -2<CR>
          nnoremap <silent> = <C-w>=

          vnoremap <silent> > >gv
          vnoremap <silent> < <gv

          nnoremap <silent> _ <C-W>s<C-W><Down>
          nnoremap <silent> <Bar> <C-W>v<C-W><Right>

          nnoremap <silent> <Leader>q :q<CR>
          nnoremap <silent> <leader>Q :bd<CR>

          nnoremap <silent> <leader>w :w<CR>

          vnoremap <leader>y "qygv<ESC>
          vnoremap <leader>x "+ygvd<ESC>

          nnoremap <silent> <Leader>t :terminal<CR>

          nnoremap <silent> <leader>e :CocCommand explorer
            \ --sources=buffer+,file+<CR>

          function! CheckBackspace() abort
            let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~# '\s'
          endfunction

          inoremap <silent><expr> <Tab>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()

          inoremap <expr> <Tab>
            \ coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
          inoremap <expr> <S-Tab>
            \ coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

          inoremap <silent><expr> <CR>
            \ coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
          '';
        };
      }
    )

  ];

  # Shell
  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    enable = true;
    shellAliases = {
      n = "nvim";
      ll = "ls -lha";
      search = "nix-env -qaP";
      clean = "sudo nix-store --gc";
      update = "sudo nix-channel --update";
      rebuild = "sudo nixos-rebuild switch";
      garbage = "sudo nix-collect-garbage -d";
      sysinfo = "nix-shell -p nix-info --run 'nix-info -m'";
      drybuild = "sudo nixos-rebuild dry-build --show-trace";
      disk = "lsblk -o name,fstype,fsavail,fsused,fsuse%,size,label,mountpoint";
    };
  };

  # Dconf for gtk theme
  programs.dconf.enable = true;
  # KDE Partition
  programs.partition-manager.enable = true;

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
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;
  };

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
