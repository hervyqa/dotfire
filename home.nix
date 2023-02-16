{
  config,
  pkgs,
  ...
}: let
  name = "hervyqa";
  fullname = "Hervy Qurrotul Ainur Rozi";
  email = "hervyqa@proton.me";
  gpgkey = "85161EB8";
  version = "22.11";
in {
  home.username = "${name}";
  home.homeDirectory = "/home/${name}";

  # Nixpkgs config
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  gtk = {
    cursorTheme = "breeze_cursors";
    iconTheme = "Papirus-Dark";
    theme = "Breeze";
  };

  home.packages = with pkgs;
  with libsForQt5;
  with nodePackages; [
    # Basic
    axel
    bottom
    dialog
    direnv
    efibootmgr
    git
    glxinfo
    gnumake
    helix
    htop
    imagemagick
    inxi
    joshuto
    nixos-option
    pfetch
    tmux
    translate-shell
    vulkan-tools
    wget
    wl-clipboard
    xclip

    # Plasma5 extra
    ark
    kate
    kgpg
    krename
    kteatime
    ktouch
    quazip
    rsibreak

    # Data science
    R
    clickhouse
    gnuplot
    grafana
    kaggle
    luigi
    metabase
    tabula
    visidata
    wxmaxima

    # Julia
    julia

    # Scala
    scala
    metals

    # Rakudo
    rakudo

    # Node
    nodejs
    yarn

    # Markdown
    marksman

    # Versioning
    git-cola

    # IDE unwrapped
    dbeaver # database
    lapce # julia
    octaveFull # matlab
    sqlitebrowser # sqlite
    litecli # sqlite
    beekeeper-studio # database
    robo3t # mongodb

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

    # Multimedia
    audacity
    v4l-utils
    vlc
    vokoscreen

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
    themechanger

    # Printer driver
    epson-escpr
    epson-escpr2
    foomatic-db
    foomatic-filters

    # SSG
    hugo
    mdbook
    mdbook-linkcheck

    # Design
    inkscape
    krita

    # Internet
    keepassxc
    media-downloader
    tdesktop

    # Provider
    gh # github
    glab # gitlab
    hut # sourcehut

    # Nonfree
    discord
    zoom-us

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
            mkdocs
            mkdocs-autorefs
            mkdocs-jupyter
            mkdocs-material
            mkdocs-material-extensions
            mkdocs-minify
            mkdocstrings
            mkdocstrings-python
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
            poetry
            pydot
            pyls-spyder
            pymongo
            pyspark
            pytest
            python
            python-lsp-jsonrpc
            python-lsp-server
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
            yt-dlp
          ]
      )
    )

    ## RStudio system wide
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
          blogdown
          bookdown
          bookdownplus
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
          languageserver
          languageserversetup
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
          r5r
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
            scalameta.metals
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
            {
              name = "r";
              publisher = "REditorSupport";
              version = "2.7.0";
              sha256 = "385a57ebc52093b209d3eba9a66b9c2f069e7b7223e7a82e1af46b1c30337825";
            }
          ];
      }
    )
  ];

  home.stateVersion = "${version}";

  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  programs = {
    java.enable = true;
    obs-studio.enable = true;

    ssh = {
      enable = false;
    };

    home-manager = {
      enable = true;
    };

    firefox = {
      enable = true;
      profiles.${name}.search.default = "DuckDuckGo";
      # policies = {
      #   CaptivePortal = false;
      #   DisableFirefoxAccounts = true;
      #   DisableFirefoxStudies = true;
      #   DisablePocket = true;
      #   DisableTelemetry = true;
      #   FirefoxHome = {
      #     Pocket = false;
      #     Snippets = false;
      #   };
      #   UserMessaging = {
      #     ExtensionRecommendations = false;
      #     SkipOnboarding = true;
      #   };
    };

    fish = {
      enable = true;
      shellAbbrs = {
        h = "hx";
        g = "git";
        t = "tmux";

        ll = "ls -lha";
        lsf = "lsblk -o name,fstype,fsavail,fsused,size,mountpoint";

        ncu = "doas nix-channel --update";
        neq = "nix-env -qaP";
        nim = "nix-shell -p nix-info --run 'nix-info -m'";
        nrd = "doas nixos-rebuild dry-build";
        nrs = "doas nixos-rebuild switch";
        ncg = "doas nix-collect-garbage -d";
        nsgc = "doas nix-store --gc";

        hms = "home-manager switch";
        hmp = "home-manager packages";

        ga = "git add";
        gaa = "git add --all";

        gb = "git branch";
        gbl = "git blame -b -w";
        gbr = "git branch --remote";

        gcm = "git commit -m";
        gcam = "git commit --amend";

        gcb = "git checkout -b";
        gck = "git checkout main";

        gcf = "git config --list";
        gcl = "git clone --recursive";
        gcln = "git clean -fd";
        gcp = "git cherry-pick";

        gd = "git diff";
        gdca = "git diff --cached";

        gfs = "git fetch sh";
        gfg = "git fetch gh";
        gfl = "git fetch gl";
        gfa = "git fetch --all --prune";

        gignore = "git update-index --assume-unchanged";

        gls = "git log --stat";
        glsp = "git log --stat -p";
        glg = "git log --graph";
        glo = "git log --oneline --decorate";

        gm = "git merge";
        gmsm = "git merge sh/main";
        gmgm = "git merge gh/main";
        gmlm = "git merge gl/main";
        gmt = "git mergetool --no-prompt";

        gpsm = "git push -u sh main";
        gpgm = "git push -u gh main";
        gplm = "git push -u gl main";

        gr = "git remote";
        gra = "git remote add";
        grh = "git reset HEAD";
        grhh = "git reset HEAD --hard";

        gs = "git status";
        gsps = "git show --pretty=short --show-signature";
        gsts = "git stash show --text";
        gsu = "git submodule update";

        gts = "git tag -s";
        gta = "git tag -a";

        gur = "git pull --rebase";
        gusm = "git pull sh main";
        gugm = "git pull gh main";
        gulm = "git pull gl main";
      };
    };

    git = {
      enable = true;
      userEmail = "${email}";
      userName = "${fullname}";
      signing = {
        key = "${gpgkey}";
        signByDefault = true;
      };
      lfs = {
        enable = true;
      };
      extraConfig = {
        core = {
          editor = "hx";
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
        status = {
          short = true;
        };
      };
    };

    helix = {
      enable = true;
      settings = {
        theme = "dotfire";

        editor = {
          #bufferline = "always"
          cursorline = true;
          # cursorcolumn = true
          line-number = "relative";
          rulers = [80];
          true-color = true;

          indent-guides = {
            render = true;
            character = "┊";
            skip-levels = 5;
          };

          lsp = {
            display-messages = true;
          };

          whitespace.render = {
            space = "none";
            tab = "all";
            newline = "none";
          };
        };

        keys = {
          normal = {
            C-w = ":w";
            C-q = ":q";
          };
          insert = {
            up = "no_op";
            down = "no_op";
            left = "no_op";
            right = "no_op";
            pageup = "no_op";
            pagedown = "no_op";
            home = "no_op";
            end = "no_op";
          };
        };
      };

      themes = {
        dotfire = {
          "ui.background" = {fg = "white";};
          "ui.background.separator" = {fg = "gray";};
          "ui.menu" = {fg = "white";};
          "ui.menu.selected" = {modifiers = ["reversed"];};
          "ui.menu.scroll" = {fg = "light-gray";};
          "ui.linenr" = {fg = "light-gray";};
          "ui.linenr.selected" = {
            fg = "white";
            modifiers = ["bold"];
          };
          "ui.popup" = {fg = "white";};
          "ui.window" = {fg = "white";};
          "ui.selection" = {bg = "gray";};
          "comment" = "gray";
          "ui.statusline" = {fg = "white";};
          "ui.statusline.inactive" = {fg = "gray";};
          "ui.statusline.normal" = {
            fg = "black";
            bg = "blue";
          };
          "ui.statusline.insert" = {
            fg = "black";
            bg = "green";
          };
          "ui.statusline.select" = {
            fg = "black";
            bg = "magenta";
          };
          "ui.help" = {fg = "light-gray";};
          "ui.cursor" = {modifiers = ["reversed"];};
          "ui.cursor.match" = {
            fg = "light-yellow";
            underline = {
              color = "light-yellow";
              style = "line";
            };
          };
          "ui.cursor.primary" = {modifiers = ["reversed" "slow_blink"];};
          "ui.cursor.secondary" = {modifiers = ["reversed"];};
          "ui.virtual.ruler" = {bg = "gray";};
          "ui.virtual.whitespace" = "gray";
          "ui.virtual.indent-guide" = "gray";

          "variable" = "light-red";
          "constant.numeric" = "yellow";
          "constant" = "yellow";
          "attribute" = "yellow";
          "type" = "light-yellow";
          "string" = "light-green";
          "variable.other.member" = "green";
          "constant.character.escape" = "light-cyan";
          "function" = "light-blue";
          "constructor" = "light-blue";
          "special" = "light-blue";
          "keyword" = "light-magenta";
          "label" = "light-magenta";
          "namespace" = "light-magenta";

          "markup.heading" = "light-blue";
          "markup.list" = "light-red";
          "markup.bold" = {
            fg = "light-yellow";
            modifiers = ["bold"];
          };
          "markup.italic" = {
            fg = "light-magenta";
            modifiers = ["italic"];
          };
          "markup.strikethrough" = {modifiers = ["crossed_out"];};
          "markup.link.url" = {
            fg = "yellow";
            underline = {
              color = "yellow";
              style = "line";
            };
          };
          "markup.link.text" = "light-red";
          "markup.quote" = "light-cyan";
          "markup.raw" = "green";
          "markup.normal" = {fg = "blue";};
          "markup.insert" = {fg = "green";};
          "markup.select" = {fg = "magenta";};

          "diff.plus" = "light-green";
          "diff.delta" = "light-blue";
          "diff.delta.moved" = "blue";
          "diff.minus" = "light-red";

          "ui.gutter" = "gray";
          "info" = "light-blue";
          "hint" = "light-gray";
          "debug" = "light-gray";
          "warning" = "light-yellow";
          "error" = "light-red";

          "diagnostic.info" = {
            underline = {
              color = "light-blue";
              style = "dotted";
            };
          };
          "diagnostic.hint" = {
            underline = {
              color = "light-gray";
              style = "double_line";
            };
          };
          "diagnostic.debug" = {
            underline = {
              color = "light-gray";
              style = "dashed";
            };
          };
          "diagnostic.warning" = {
            underline = {
              color = "light-yellow";
              style = "curl";
            };
          };
          "diagnostic.error" = {
            underline = {
              color = "light-red";
              style = "curl";
            };
          };
        };
      };
    };

    tmux = {
      enable = true;
      clock24 = true;
      terminal = "screen-256color";
      historyLimit = 10000;
      plugins = with pkgs.tmuxPlugins; [
        battery
        better-mouse-mode
        continuum
        jump
        pain-control
        prefix-highlight
        resurrect
        tilish
        yank
      ];
      prefix = "C-a";
      extraConfig = ''
        unbind C-b
        set -as terminal-overrides ",*:Tc"

        bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xclip -in -selection clipboard"
        bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "xclip -in -selection clipboard"

        bind-key -n M-n new-window -c "#{pane_current_path}"
        bind-key -n M-. select-window -n
        bind-key -n M-, select-window -p
        bind-key -n M-< swap-window -t -1
        bind-key -n M-> swap-window -t +1
        bind-key -n M-X confirm-before "kill-window"
        bind-key -n M-v split-window -h -c "#{pane_current_path}"
        bind-key -n M-b split-window -v -c "#{pane_current_path}"
        bind-key -n M-R command-prompt -I "" "rename-window '%%'"
        bind-key -n M-f resize-pane -Z
        bind-key -n M-h select-pane -L
        bind-key -n M-l select-pane -R
        bind-key -n M-k select-pane -U
        bind-key -n M-j select-pane -D
        bind-key -n M-x confirm-before "kill-pane"
        bind-key -n M-/ copy-mode

        set -g base-index 1
        set -g bell-action any
        set -g focus-events on
        set -g message-style fg=colour0,bg=colour3
        set -g mouse on
        set -g status-interval 1
        set -g status-justify centre
        set -g status-left ""
        set -g status-right ""
        set -g status-style fg=colour15
        set -g visual-activity on
        set -s escape-time 0

        set-option -g renumber-windows on
        set-option -g set-clipboard off
        set-option -g set-titles on
        set-option -g set-titles-string 'tmux - #W'
        set-option -g status-keys vi
        set-option -g visual-bell off

        setw -g mode-keys vi
        setw -g monitor-activity on
        setw -g window-status-bell-style fg=colour1
        setw -g window-status-current-style fg=blue,bold
        setw -g window-status-style fg=colour250
        setw -g window-status-current-format ' #{?#{==:#W,#{b:SHELL}},#{b:pane_current_path},#W} '
        setw -g window-status-format ' #{?#{==:#W,#{b:SHELL}},#{b:pane_current_path},#W} '
      '';
    };
  };

  xdg = {
    mimeApps = {
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
  };
}
