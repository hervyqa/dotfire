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
        browsers = ["firefox.desktop"];
        discord = ["discord.desktop"];
        dolphin = ["org.kde.dolphin.desktop"];
        dragon = ["org.kde.dragonplayer.desktop"];
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
        "video/mp4" = dragon;
        "video/ogg" = dragon;
        "video/webm" = dragon;
        "video/x-flv" = dragon;
        "video/x-matroska" = dragon;
        "video/x-ms-wmv" = dragon;
        "video/x-ogm+ogg" = dragon;
        "video/x-theora+ogg" = dragon;
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
