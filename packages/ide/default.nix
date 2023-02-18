{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      dbeaver # database
      lapce # julia
      octaveFull # matlab
      sqlitebrowser # sqlite
      litecli # sqlite
      beekeeper-studio # database
      robo3t # mongodb
      git-cola # git
    ];
  };
}
