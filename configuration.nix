{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Allow proprietary software.
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
    initrd.secrets = {
      "/crypto_keyfile.bin" = null;
    };
  };

  networking = {
    hostName = "nixos"; # Define your hostname.
    networkmanager.enable = true;
    wireless.enable = false;  # Enables via wpa_supplicant.
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
    users.hervyqa = {
      isNormalUser = true;
      description = "Hervy Qurrotul Ainur Rozi";
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

  # Nix settings
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      trusted-users = [ "root" "hervyqa"];
    };
  };

  # Fonts.
  fonts.fonts = with pkgs; [
    fira
    fira-code
    font-awesome
    google-fonts
    ibm-plex
    jetbrains-mono
  ];

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
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

      # CLI packages
      bottom
      direnv
      dnscrypt-proxy2
      earlyoom
      efibootmgr
      fish
      git
      gitui
      home-manager
      htop
      inxi
      joshuto
      nixos-option
      texlab
      translate-shell
      vulkan-tools
      wget
      wl-clipboard
      xclip

      # KDE plasma
      libsForQt5.ark
      libsForQt5.kate
      libsForQt5.ktouch
      libsForQt5.quazip
      libsForQt5.sddm-kcm
      wacomtablet

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
      lxappearance
      papirus-icon-theme

      # Printer driver
      epson-escpr
      epson-escpr2
      foomatic-db
      foomatic-filters

      # Nonfree
      discord
      zoom-us

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

      # Python310 system wide
      (python310.withPackages(ps: with ps; [
        Theano
        beautifulsoup4
        bokeh
        dask
        datasette
        flask
        imbalanced-learn
        ipykernel
        ipython
        jedi
        jedi-language-server
        jupyter
        jupyterlab
        jupyterlab-lsp
        jupyterlab-pygments
        keras
        lightgbm
        mahotas
        matplotlib
        networkx
        nltk
        numpy
        opencv4
        openpyxl
        pandas
        pillow
        plotly
        plotnine
        pydot
        pyls-spyder
        pynvim
        pytest
        qdarkstyle
        requests
        scikit-learn
        scipy
        scrapy
        seaborn
        selenium
        spacy
        spyder
        spyder-kernels
        statsmodels
        tableaudocumentapi
        tensorflow
        tensorflow-metadata
        tensorflow-probability
        torch
        torchvision
        trfl
        virtualenv
        virtualenvwrapper
        wordcloud
        xarray
        ])
      )

      # VSCodium system wide
      (vscode-with-extensions.override {
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
      })

      # RStudio system wide
      # failed to compiling:
      # arrow, Hmisc (interp), ggforce, prophet
      (rstudioWrapper.override {
        packages = with rPackages; [
          Cairo
          DT
          DataExplorer
          JuliaCall
          JuliaConnectoR
          RColorBrewer
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
          tidyxl
          tmap
          tmaptools
          tsbox
          usethis
          validate
          vroom
          yaml
          ymlthis
          zoo
        ];
      })

      # Neovim system wide
      (neovim.override {
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
    kdeconnect.enable = true;
    neovim.defaultEditor = true;
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
          email = "hervyqa@proton.me";
          name = "Hervy Qurrotul Ainur Rozi";
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
        lsf = "lsblk -o name,fstype,fsavail,fsused,fsuse%,size,label,mountpoint";

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
        gapa = "git add --patch";

        gb = "git branch";
        gba = "git branch -a";
        gbdam = "git branch --merged";
        gbl = "git blame -b -w";
        gbnm = "git branch --no-merged";
        gbr = "git branch --remote";

        gc = "git commit -v";
        gca = "git commit -v -a";
        gcam = "git commit -a -m";
        gcms = "git commit -m";
        gcaan = "git commit -v -a --no-edit --amend";
        gcaans = "git commit -v -a -s --no-edit --amend";
        gcamn = "git commit -v --amend";
        gcaamn = "git commit -v -a --amend";
        gcna = "git commit -v --no-edit --amend";

        gcb = "git checkout -b";
        gcf = "git config --list";
        gcl = "git clone --recursive";
        gclean = "git clean -fd";
        gcm = "git checkout main";
        gcmt = "git checkout master";
        gco = "git checkout";
        gcp = "git cherry-pick";
        gcs = "git commit -S";

        gd = "git diff";
        gdca = "git diff --cached";

        gf = "git fetch";
        gfa = "git fetch --all --prune";
        gfo = "git fetch origin";

        gignore = "git update-index --assume-unchanged";

        gl = "git pull";
        glg = "git log --stat";
        glgp = "git log --stat -p";
        glgg = "git log --graph";
        glgga = "git log --graph --decorate --all";
        glgm = "git log --graph --max-count=10";
        glo = "git log --oneline --decorate";
        glol = "git log --graph --abbrev-commit";
        glola = "git log --graph --abbrev-commit --all";
        glog = "git log --oneline --decorate --graph";
        gloga = "git log --oneline --decorate --graph --all";

        gm = "git merge";
        gmom = "git merge origin/master";
        gmon = "git merge origin/main";
        gmt = "git mergetool --no-prompt";

        gp = "git push";
        gpom = "git push -u origin main";
        gpoms = "git push -u origin master";
        gpd = "git push --dry-run";
        gpv = "git push -v";

        gr = "git remote";
        gra = "git remote add";
        grh = "git reset HEAD";
        grhh = "git reset HEAD --hard";

        gsb = "git status -sb";
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
  };

  # Services
  services = {
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
      enable = true;
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
      };
      displayManager.sddm.enable = true;
      layout = "us";
      libinput.enable = true;
      xkbVariant = "";
    };
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # System upgrade
  system.stateVersion = "22.11";
}
