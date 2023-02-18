{
  config,
  pkgs,
  libs,
  ...
}: {
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
}
