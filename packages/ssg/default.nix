{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      hugo
      mdbook
      mdbook-linkcheck
    ];
  };
}
