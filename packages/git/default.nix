{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      gh
      gitless
      gitlint
      glab
      hut
    ];
  };
}
