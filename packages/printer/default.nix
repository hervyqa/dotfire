{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      epson-escpr
      epson-escpr2
      foomatic-db
      foomatic-filters
    ];
  };
}
