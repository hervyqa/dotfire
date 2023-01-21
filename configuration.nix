{
  config,
  pkgs,
  libs,
  ...
}:

let
  name = "hervyqa";
  fullname = "Hervy Qurrotul Ainur Rozi";
  email = "hervyqa@proton.me";

  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
    dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
    systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };

  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure-gtk";
    executable = true;
    text = let
      schema = pkgs.gsettings-desktop-schemas;
      datadir = "${schema}/share/gsettings-schemas/${schema.name}";
    in ''
      export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
      gnome_schema=org.gnome.desktop.interface
      '';
  };

in

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        useOSProber = false; # default: false
      };
    };
    initrd.secrets = {
      "/crypto_keyfile.bin" = null;
    };
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
    # Configure network proxy if necessary
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  # Define a user account.
  users = {
    users.${name} = {
      isNormalUser = true;
      description = "${fullname}";
      extraGroups = [
        "audio"
        "disk"
        "input"
        "lp"
        "network"
        "networkmanager"
        "scanner"
        "sound"
        "systemd-journal"
        "video"
        "wheel"
      ];
    };
    defaultUserShell = pkgs.fish;
  };

  # Nix settings.
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

  # Nixpkgs config.
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Fonts.
  fonts = {
    fonts = with pkgs; [
      fira
      fira-code
      font-awesome
      google-fonts
      ibm-plex
      jetbrains-mono
      source-han-sans
    ];
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Source Han Serif" ];
      sansSerif = [ "Noto Sans" "Source Han Sans" ];
    };
  };

  # Packages
  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    etc = {
      "greetd/environments".text = ''
        sway
        fish
        bash
      '';
    };

    systemPackages = with pkgs; [

      # CLI packages
      bottom
      dialog
      direnv
      dnscrypt-proxy2
      earlyoom
      efibootmgr
      fish
      git
      gitui
      glxinfo
      gnumake
      home-manager
      htop
      inxi
      joshuto
      nixos-option
      texlab
      translate-shell
      udisks
      vulkan-tools
      wget
      wl-clipboard
      xclip

      # Plasma5 extra
      libsForQt5.ark
      libsForQt5.kate
      libsForQt5.ktouch
      libsForQt5.quazip

      # Data science
      R
      clickhouse
      duckdb
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
      texstudio # latex

      # Devops
      mongodb
      sqlite

      # Browser
      firefox

      # Design
      inkscape
      krita

      # Multimedia
      vlc
      vokoscreen

      # Office
      libreoffice
      libreoffice-qt

      # Communication
      tdesktop

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

      # Nonfree
      discord
      zoom-us

      # Python310 system wide
      (
        python310.withPackages (ps:
          with ps; [
            Theano
            av
            beautifulsoup4
            bokeh
            cython
            click
            dask
            datasette
            dill
            flask
            future
            h5py
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
            pytest
            pytorch
            pyyaml
            qdarkstyle
            requests
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
          vscodeExtensions = with vscode-extensions; [
            azdavis.millet
            b4dm4n.vscode-nixpkgs-fmt
            bbenoist.nix
            bmalehorn.vscode-fish
            editorconfig.editorconfig
            esbenp.prettier-vscode
            formulahendry.code-runner
            grapecity.gc-excelviewer
            kamadorueda.alejandra
            mechatroner.rainbow-csv
            mhutchie.git-graph
            ms-pyright.pyright
            ms-python.python
            ms-toolsai.jupyter
            ms-toolsai.jupyter-keymap
            ms-toolsai.jupyter-renderers
            ms-toolsai.vscode-jupyter-cell-tags
            ms-toolsai.vscode-jupyter-slideshow
            ms-vscode.anycode
            pkief.material-icon-theme
            scala-lang.scala
            shardulm94.trailing-spaces
            streetsidesoftware.code-spell-checker
          ];
        }
      )

      # RStudio system wide
      # failed to compiling:
      # arrow, Hmisc (interp), ggforce, prophet
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
            beepr
            colourpicker
            dataCompareR
            data_table
            datapasta
            devtools
            diffobj
            dplyr
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
            vroom
            xts
            yaml
            ymlthis
            zoo
          ];
        }
      )

      # Neovim system wide
      (
        neovim.override {
          viAlias = true;
          vimAlias = true;
          withNodeJs = true;
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
                julia-vim
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
                vim-wayland-clipboard
              ];
              opt = [];
            };
            customRC = ''
              filetype indent on
              filetype on
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

              " Visua; select
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
        }
      )
    ];
  };

  # Programs
  programs = {
    dconf.enable = true;
    java.enable = true;
    light.enable = true;
    neovim.defaultEditor = true;
    kdeconnect.enable = true;
    partition-manager.enable = true;
    mtr.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    tmux = {
      enable = true;
      terminal = "screen-256color";
      historyLimit = 5000;
    };

    git = {
      enable = true;
      config = {
        core = {
          editor = "nvim";
        };
        user = {
          email = "${email}";
          name = "${fullname}";
        };
        init = {
          defaultBranch = "main";
        };
        url = {
          "https://github.com/" = {
            insteadOf = [
              "gh:"
              "github:"
            ];
          };
        };
        status = {
          short = true;
        };
      };
    };

    fish = {
      enable = true;
      shellAbbrs = {
        n = "nvim";
        v = "vim";
        g = "git";

        ll = "ls -lha";
        lsf = "lsblk -o name,fstype,fsavail,fsused,size,mountpoint";

        ncg = "sudo nix-collect-garbage -d";
        ncu = "sudo nix-channel --update";
        neq = "nix-env -qaP";
        nim = "nix-shell -p nix-info --run 'nix-info -m'";
        nrd = "sudo nixos-rebuild dry-build --show-trace";
        nrs = "sudo nixos-rebuild switch";
        nrt = "sudo nixos-rebuild test";
        nrb = "sudo nixos-rebuild boot";
        nsgc = "sudo nix-store --gc";

        ga = "git add";
        gaa = "git add --all";

        gb = "git branch";
        gbl = "git blame -b -w";
        gbr = "git branch --remote";

        gc = "git commit";
        gcm = "git commit -m";
        gcam = "git commit --amend";

        gcb = "git checkout -b";
        gcf = "git config --list";
        gck = "git checkout main";
        gcl = "git clone --recursive";
        gcln = "git clean -fd";
        gcp = "git cherry-pick";
        gcs = "git commit -S";

        gd = "git diff";
        gdca = "git diff --cached";

        gf = "git fetch";
        gfa = "git fetch --all --prune";
        gfo = "git fetch origin";

        gignore = "git update-index --assume-unchanged";

        gl = "git pull";
        gls = "git log --stat";
        glsp = "git log --stat -p";
        glg = "git log --graph";
        glga = "git log --graph --decorate --all";
        glo = "git log --oneline --decorate";
        gloa = "git log --oneline --decorate --graph --all";

        gm = "git merge";
        gmom = "git merge origin/main";
        gmt = "git mergetool --no-prompt";

        gp = "git push";
        gpom = "git push -u origin main";
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

      shellAliases = {
      };
    };

    # Sway
    sway = {
      enable = false;
      wrapperFeatures.gtk = true;
          extraPackages = with pkgs; [

            # Sway config
            configure-gtk
            dbus-sway-environment

            # Sway packages
            alacritty # gpu accelerated terminal
            autotiling # auto tiling for i3/sway
            dmenu-wayland # menu wayland
            glib # gsettings
            gnome3.adwaita-icon-theme  # default gnome cursors
            grim # screenshot functionality
            kanshi # dynamic display configuration tool
            mako # notification system developed
            mpd # music player
            mpv # video player
            mupdf # pdf reader
            ncmpcpp # ncurses based mpd client
            pcmanfm # file manager gtk
            qutebrowser # browser
            slurp # screenshot functionality
            swayidle # idle management daemon
            swaykbdd # per-window keyboard layout for sway
            swaylock # lockscreen sway
            swaysettings # sway gui settings
            waybar # wayland sway bar
            wdisplays # configuring displays
            wf-recorder # screen recording
            wmctrl # interact netwm x wm
            wofi # menu launcher
            wvkbd # on-screen keyboard for wlroots
            xdg-utils # for opening default programs when clicking links

            # Theme
            lxappearance
            arc-theme
            arc-kde-theme

            # Qt
            libsForQt5.qt5ct
            libsForQt5.qtstyleplugin-kvantum

      ];
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
        export MOZ_ENABLE_WAYLAND=1
      '';
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
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

    greetd = {
      enable = false;
      settings = rec {
        initial_session = {
          command = "${pkgs.sway}/bin/sway";
          user = "${name}";
        };
        default_session = initial_session;
      };
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

    postgresql = {
      enable = false;
    };

    printing = {
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
      excludePackages = with pkgs; [
        xterm
      ];
      displayManager = {
        defaultSession = "plasmawayland";
        sddm = {
          enable = true;
        };
        lightdm = {
          enable = false;
          greeter.enable = false;
        };
        autoLogin = {
          enable = true;
          user = "${name}";
        };
      };
      layout = "us";
      libinput.enable = true;
      xkbVariant = "";
    };
  };

  # Systemd
  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
    };
  };

  # Hardware
  sound.enable = true;
  hardware = {
    pulseaudio.enable = false;
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

  # Security
  security = {
    rtkit.enable = true;
    pam.services.kwallet = {
      name = "kwallet";
      enableKwallet = true;
    };
  };

  # Firewall.
  networking.firewall = {
    enable = false;
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
  };

  # System upgrade
  system.stateVersion = "22.11";
}
