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
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
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
      };
    };
    initrd.secrets = {
      "/crypto_keyfile.bin" = null;
    };
    kernel = {
      sysctl = {
        "vm.swappiness" = 10;
      };
    };
    tmpOnTmpfs = true;
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
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
    # Configure network proxy if necessary.
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
    defaultUserShell = pkgs.fish;
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
      firefox = {
        enablePlasmaBrowserIntegration = false;
      };
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

  # Packages
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      MOZ_ENABLE_WAYLAND = "1";
    };

    systemPackages = with pkgs;
    with libsForQt5;
    with nodePackages; [
      # Plasma5 extra
      applet-window-buttons
      ark
      kate
      kgpg
      kteatime
      ktouch
      quazip
      rsibreak

      # CLI packages
      axel
      bottom
      dialog
      direnv
      efibootmgr
      git
      gitui
      glxinfo
      gnumake
      htop
      imagemagick
      inxi
      joshuto
      nixos-option
      translate-shell
      vulkan-tools
      wget
      wl-clipboard
      xclip

      # Data science
      R
      clickhouse
      gnuplot
      grafana
      kaggle
      luigi
      metabase
      paraview
      tabula
      visidata
      wxmaxima

      # Julia
      julia

      # Scala
      scala

      # Rakudo
      rakudo

      # Node
      nodejs
      yarn

      # IDE unwrapped
      dbeaver # database
      octaveFull # matlab
      sqlitebrowser # sqlite
      beekeeper-studio # database

      # Devops
      mongodb
      sqlite

      # Design
      inkscape
      krita

      # Multimedia
      vlc
      vokoscreen
      obs-studio

      # Office
      libreoffice
      libreoffice-qt
      zotero

      # Latex
      kbibtex
      kile
      texlab
      texlive.combined.scheme-medium
      texstudio

      # Mind mapping
      heimer
      umbrello
      vym

      # Theme/Icon
      papirus-icon-theme

      # Printer driver
      epson-escpr
      epson-escpr2
      foomatic-db
      foomatic-filters

      # Compression
      bzip2
      gzip
      libarchive
      lz4
      lzip
      lzo
      lzop
      p7zip
      rzip
      unzip
      xz
      zip
      zstd

      # SSG
      hugo
      mdbook
      mdbook-linkcheck

      # Communication
      tdesktop

      # Nonfree
      discord
      zoom-us

      # Force sudo to doas
      (pkgs.writeScriptBin "sudo" ''exec doas "$@"'')

      # RStudio system wide
      # failed to compiling:
      # arrow, Hmisc (interp), ggforce, prophet, torch
      (
        rstudioWrapper.override {
          packages = with rPackages; [
            Cairo
            DT
            DataExplorer
            JuliaCall
            JuliaConnectoR
            MASS
            RANN
            RColorBrewer
            Rcpp
            XML
            baseline
            beepr
            caret
            colourpicker
            dataCompareR
            data_table
            datapasta
            devtools
            diffobj
            dplyr
            duckdb
            dygraphs
            echarts4r
            esquisse
            flexdashboard
            forecast
            foreign
            freqparcoord
            fst
            geofacet
            ggiraph
            ggplot2
            glue
            gmodels
            gridExtra
            gym
            here
            httr
            installr
            janitor
            jsonlite
            knitr
            leaflet
            listviewer
            lme4
            lubridate
            magrittr
            mapsapi
            officer
            openNLP
            openxlsx
            optparse
            pacman
            paletteer
            patchwork
            plotly
            plumber
            profvis
            purrr
            quantmod
            quarto
            reactable
            readr
            readxl
            remedy
            remotes
            reshape2
            reticulate
            rio
            rmarkdown
            roxygen2
            rvest
            scales
            sf
            shiny
            shinyjs
            spatstat
            splitstackshape
            sqldf
            stringr
            tensorflow
            testthat
            tidycensus
            tidygeocoder
            tidymodels
            tidyquant
            tidyr
            tidytext
            tidyverse
            tidyxl
            tmap
            tmaptools
            tsbox
            usethis
            validate
            vetiver
            vroom
            xts
            yaml
            ymlthis
            zoo
          ];
        }
      )

      # Python3 system wide
      (
        python3.withPackages (
          ps:
            with ps; [
              Theano
              av
              baseline
              beautifulsoup4
              bokeh
              click
              cython
              dash
              dask
              datasette
              dill
              duckdb
              flask
              future
              gym
              h5py
              ibm-watson
              imbalanced-learn
              ipykernel
              ipython
              ipywidgets
              jedi
              jedi-language-server
              joblib
              jupyter
              jupyterlab
              jupyterlab-lsp
              jupyterlab-pygments
              keras
              lightgbm
              mahotas
              matplotlib
              moviepy
              mypy
              nbdime
              networkx
              nltk
              nose
              numpy
              opencv4
              openpyxl
              pandas
              pillow
              pims
              plotly
              plotnine
              pydot
              pyls-spyder
              pynvim
              pyspark
              pytest
              pytorch
              pyyaml
              qdarkstyle
              requests
              sagemaker
              scikit-learn
              scikitimage
              scipy
              scrapy
              seaborn
              selenium
              spacy
              spyder
              spyder-kernels
              statsmodels
              sympy
              tableaudocumentapi
              tables
              tensorflow
              tensorflow-metadata
              tensorflow-probability
              tifffile
              torch
              torchvision
              tqdm
              trfl
              virtualenv
              virtualenvwrapper
              wordcloud
              xarray
            ]
        )
      )

      # VSCodium system wide
      (
        vscode-with-extensions.override {
          vscode = vscodium;
          vscodeExtensions = with vscode-extensions;
            [
              azdavis.millet
              b4dm4n.vscode-nixpkgs-fmt
              bbenoist.nix
              bmalehorn.vscode-fish
              davidanson.vscode-markdownlint
              donjayamanne.githistory
              editorconfig.editorconfig
              esbenp.prettier-vscode
              formulahendry.code-runner
              grapecity.gc-excelviewer
              kamadorueda.alejandra
              mechatroner.rainbow-csv
              mhutchie.git-graph
              ms-pyright.pyright
              ms-python.python
              ms-python.vscode-pylance
              ms-toolsai.jupyter
              ms-toolsai.jupyter-keymap
              ms-toolsai.jupyter-renderers
              ms-toolsai.vscode-jupyter-cell-tags
              ms-toolsai.vscode-jupyter-slideshow
              ms-vscode.anycode
              naumovs.color-highlight
              pkief.material-icon-theme
              scala-lang.scala
              shardulm94.trailing-spaces
              shd101wyy.markdown-preview-enhanced
              streetsidesoftware.code-spell-checker
              yzhang.markdown-all-in-one
            ]
            ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
              {
                name = "language-julia";
                publisher = "julialang";
                version = "1.38.2";
                sha256 = "07b8c8748f85dfd99a5ff23eadf7c88e64b9f7e07d6adb2be6bcd7f9cfbe5aa9";
              }
            ];
        }
      )
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
    java.enable = true;
    kdeconnect.enable = true;
    light.enable = true;
    mtr.enable = true;
    partition-manager.enable = true;

    firefox = {
      enable = true;
      policies = {
        CaptivePortal = false;
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        FirefoxHome = {
          Pocket = false;
          Snippets = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    tmux = {
      enable = true;
      clock24 = true;
      terminal = "screen-256color";
      historyLimit = 5000;
    };

    git = {
      enable = true;
      config = {
        commit = {
          gpgsign = "true";
        };
        core = {
          editor = "nvim";
        };
        init = {
          defaultBranch = "main";
        };
        pull = {
          rebase = "true";
        };
        url = {
          "git@git.sr.ht:" = {
            insteadOf = [
              "https://git.sr.ht/"
            ];
          };
          "git@github.com:" = {
            insteadOf = [
              "https://github.com/"
            ];
          };
          "git@gitlab.com:" = {
            insteadOf = [
              "https://gitlab.com/"
            ];
          };
        };
        user = {
          email = "${email}";
          name = "${fullname}";
          signingKey = "${gpgkey}";
        };
        status = {
          short = true;
        };
      };
    };

    fish = {
      enable = true;
      useBabelfish = true;
      shellAbbrs = {
        n = "nvim";
        v = "vim";
        g = "git";

        ll = "ls -lha";
        lsf = "lsblk -o name,fstype,fsavail,fsused,size,mountpoint";

        ncg = "doas nix-collect-garbage -d";
        ncu = "doas nix-channel --update";
        neq = "nix-env -qaP";
        nim = "nix-shell -p nix-info --run 'nix-info -m'";
        nrd = "doas nixos-rebuild dry-build";
        nrs = "doas nixos-rebuild switch";
        nrt = "doas nixos-rebuild test";
        nrb = "doas nixos-rebuild boot";
        nsgc = "doas nix-store --gc";

        ga = "git add";
        gaa = "git add --all";

        gb = "git branch";
        gbl = "git blame -b -w";
        gbr = "git branch --remote";

        gc = "git commit";
        gcm = "git commit -m";
        gcam = "git commit --amend";
        gcs = "git commit -S";
        gcsm = "git commit -S -m";

        gcb = "git checkout -b";
        gcf = "git config --list";
        gck = "git checkout main";
        gcl = "git clone --recursive";
        gcln = "git clean -fd";
        gcp = "git cherry-pick";

        gd = "git diff";
        gdca = "git diff --cached";

        gf = "git fetch";
        gfa = "git fetch --all --prune";
        gfs = "git fetch sh";
        gfg = "git fetch gh";
        gfl = "git fetch gl";

        gignore = "git update-index --assume-unchanged";

        gl = "git pull";
        gls = "git log --stat";
        glsp = "git log --stat -p";
        glg = "git log --graph";
        glga = "git log --graph --decorate --all";
        glo = "git log --oneline --decorate";
        gloa = "git log --oneline --decorate --graph --all";

        gm = "git merge";
        gmsm = "git merge sh/main";
        gmgm = "git merge gh/main";
        gmlm = "git merge gl/main";
        gmt = "git mergetool --no-prompt";

        gp = "git push";
        gpsm = "git push -u sh main";
        gpgm = "git push -u gh main";
        gplm = "git push -u gl main";
        gpd = "git push --dry-run";
        gpv = "git push -v";

        gr = "git remote";
        gra = "git remote add";
        grh = "git reset HEAD";
        grhh = "git reset HEAD --hard";

        gs = "git status -sbu";
        gsps = "git show --pretty=short --show-signature";
        gss = "git status -s";
        gst = "git status";
        gsts = "git stash show --text";
        gsu = "git submodule update";

        gts = "git tag -s";
        gta = "git tag -a";
      };

      shellAliases = {};
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
      configure = {
        packages.myPlugins = with pkgs.vimPlugins; {
          start = [
            coc-clap
            coc-diagnostic
            coc-eslint
            coc-explorer
            coc-fzf
            coc-git
            coc-haxe
            coc-highlight
            coc-java
            coc-json
            coc-lists
            coc-markdownlint
            coc-metals
            coc-nvim
            coc-pairs
            coc-prettier
            coc-pyright
            coc-python
            coc-r-lsp
            coc-rls
            coc-sh
            coc-smartf
            coc-sqlfluff
            coc-stylelint
            coc-sumneko-lua
            coc-texlab
            coc-toml
            coc-ultisnips
            coc-vimlsp
            coc-vimtex
            coc-wxml
            coc-yaml
            coc-yank
            julia-vim
            nvim-autopairs
            nvim-lastplace
            nvim-web-devicons
            scope-nvim
            scrollbar-nvim
            statix
            surround-nvim
            tabline-nvim
            telescope-nvim
            vim-airline
            vim-airline-themes
            vim-commentary
            vim-lightline-coc
            vim-nix
            vim-wayland-clipboard
          ];
          opt = [];
        };
        customRC = ''
          filetype indent on
          filetype on
          set autoindent
          set backspace=indent,eol,start
          set clipboard+=unnamedplus
          set encoding=utf-8
          set expandtab
          set history=1000
          set hlsearch
          set ignorecase
          set incsearch
          set linebreak breakindent
          set list listchars=tab:>>,trail:~
          set nobackup
          set nocompatible
          set nomodified
          set nowrap
          set nowritebackup
          set number relativenumber
          set scrolloff=10
          set shiftwidth=2
          set showcmd
          set showmatch
          set showmode
          set signcolumn=yes
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

          " Default leader
          let g:mapleader = "\<Space>"

          " Navigation
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

          " Resize panes
          nnoremap <silent> <Left> :vertical resize +2<CR>
          nnoremap <silent> <Right> :vertical resize -2<CR>
          nnoremap <silent> <Up> :resize +2<CR>
          nnoremap <silent> <Down> :resize -2<CR>
          nnoremap <silent> = <C-w>=

          " Visual select
          vnoremap <silent> > >gv
          vnoremap <silent> < <gv

          " Split pane
          nnoremap <silent> _ <C-W>s<C-W><Down>
          nnoremap <silent> <Bar> <C-W>v<C-W><Right>

          " Quit
          nnoremap <silent> <Leader>q :q<CR>
          nnoremap <silent> <leader>Q :bd<CR>

          " Save
          nnoremap <silent> <leader>w :w<CR>

          " Clipboard
          vnoremap <leader>p "+p
          nnoremap <leader>P "+P
          vnoremap <leader>P "+P
          nnoremap <leader>y "+y
          vnoremap <leader>y "+y
          nnoremap <leader>Y "+y$

          " Terminal
          nnoremap <silent> <Leader>t :terminal<CR>

          " Open explorer
          nnoremap <silent> <leader>e :CocCommand explorer
            \ --sources=buffer+,file+<CR>

          " Use tab for trigger completion with characters ahead and navigate
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

          function! CheckBackspace() abort
            let col = col('.') - 1
            return !col || getline('.')[col - 1]  =~# '\s'
          endfunction

          " Use <c-space> to trigger completion
          if has('nvim')
            inoremap <silent><expr> <c-space> coc#refresh()
          else
            inoremap <silent><expr> <c-@> coc#refresh()
          endif
        '';
      };
    };
  };

  xdg = {
    mime = {
      enable = true;
      defaultApplications = let
        browsers = ["firefox.desktop"];
        discord = ["discord.desktop"];
        dolphin = ["org.kde.dolphin.desktop"];
        elisa = ["org.kde.elisa.desktop"];
        gimp = ["gimp.desktop"];
        gwenview = ["org.kde.gwenview.desktop"];
        inkscape = ["org.inkscape.Inkscape.desktop"];
        kate = ["org.kde.kate.desktop"];
        kdeconnect = ["org.kde.kdeconnect.handler.desktop"];
        kmail2 = ["org.kde.kmail2.desktop"];
        krita = ["krita_psd.desktop"];
        ktorrent = ["org.kde.ktorrent.desktop"];
        marble = ["marble_geo.desktop"];
        okular = ["org.kde.okular.desktop"];
        vlc = ["vlc.desktop"];
        wine = ["wine.desktop"];
      in {
        "application/pdf" = okular;
        "application/vnd.ms-publisher" = kate;
        "application/x-bittorrent" = ktorrent;
        "application/x-extension-htm" = browsers;
        "application/x-extension-html" = browsers;
        "application/x-extension-shtml" = browsers;
        "application/x-extension-xht" = browsers;
        "application/x-extension-xhtml" = browsers;
        "application/x-ms-dos-executable" = wine;
        "application/xhtml+xml" = browsers;
        "application/xml" = kate;
        "audio/aac" = elisa;
        "audio/flac" = elisa;
        "audio/mp4" = elisa;
        "audio/mpeg" = elisa;
        "audio/ogg" = elisa;
        "audio/x-wav" = elisa;
        "image/gif" = gwenview;
        "image/jpeg" = gwenview;
        "image/png" = gwenview;
        "image/svg+xml" = inkscape;
        "image/vnd.adobe.photoshop" = krita;
        "image/webp" = gwenview;
        "image/x-eps" = inkscape;
        "image/x-xcf" = gimp;
        "inode/directory" = dolphin;
        "text/html" = browsers;
        "text/markdown" = kate;
        "text/plain" = kate;
        "text/uri-list" = browsers;
        "video/mp4" = vlc;
        "video/ogg" = vlc;
        "video/webm" = vlc;
        "video/x-flv" = vlc;
        "video/x-matroska" = vlc;
        "video/x-ms-wmv" = vlc;
        "video/x-ogm+ogg" = vlc;
        "video/x-theora+ogg" = vlc;
        "x-scheme-handler/about" = browsers;
        "x-scheme-handler/chrome" = browsers;
        "x-scheme-handler/discord" = discord;
        "x-scheme-handler/ftp" = browsers;
        "x-scheme-handler/geo" = marble;
        "x-scheme-handler/http" = browsers;
        "x-scheme-handler/https" = browsers;
        "x-scheme-handler/mailto" = kmail2;
        "x-scheme-handler/tel" = kdeconnect;
        "x-scheme-handler/unknown" = browsers;
      };
    };
    portal = {
      enable = true;
      wlr.enable = true;
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
      enable = false;
    };

    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    openssh = {
      enable = false;
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
        defaultSession = "plasma"; # or plasmawayland
        sddm = {
          enable = true;
          autoNumlock = true;
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
      hsphfpd.enable = true;
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
    stateVersion = "21.11";
  };
}
