{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      kbibtex
      kile
      texlab
      texlive.combined.scheme-medium
      texstudio
    ];
  };
}
