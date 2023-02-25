{
  config,
  pkgs,
  libs,
  ...
}: {
  xdg = {
    mime = {
      enable = true;
      defaultApplications = let
        discord = ["discord.desktop"];
        dolphin = ["org.kde.dolphin.desktop"];
        dragonplayer = ["org.kde.dragonplayer.desktop"];
        elisa = ["org.kde.elisa.desktop"];
        firefox = ["firefox.desktop"];
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
        "application/x-extension-htm" = firefox;
        "application/x-extension-html" = firefox;
        "application/x-extension-shtml" = firefox;
        "application/x-extension-xht" = firefox;
        "application/x-extension-xhtml" = firefox;
        "application/x-ms-dos-executable" = wine;
        "application/xhtml+xml" = firefox;
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
        "text/html" = firefox;
        "text/markdown" = kate;
        "text/plain" = kate;
        "text/uri-list" = firefox;
        "video/mp4" = dragonplayer;
        "video/ogg" = dragonplayer;
        "video/webm" = dragonplayer;
        "video/x-flv" = dragonplayer;
        "video/x-matroska" = dragonplayer;
        "video/x-ms-wmv" = dragonplayer;
        "video/x-ogm+ogg" = dragonplayer;
        "video/x-theora+ogg" = dragonplayer;
        "x-scheme-handler/about" = firefox;
        "x-scheme-handler/chrome" = firefox;
        "x-scheme-handler/discord" = discord;
        "x-scheme-handler/ftp" = firefox;
        "x-scheme-handler/geo" = marble;
        "x-scheme-handler/http" = firefox;
        "x-scheme-handler/https" = firefox;
        "x-scheme-handler/mailto" = kmail2;
        "x-scheme-handler/tel" = kdeconnect;
        "x-scheme-handler/unknown" = firefox;
      };
    };
  };
}
