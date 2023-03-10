{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      dbeaver # database
      lapce # julia
      sqlitebrowser # sqlite
      litecli # sqlite
      beekeeper-studio # database
      robo3t # mongodb
      git-cola # git
    ];
  };
}
