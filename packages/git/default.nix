{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      gh # github
      glab # gitlab
      hut # sourcehut
    ];
  };
}
