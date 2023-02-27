{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    printing = {
      enable = true;
      stateless = true;
      webInterface = false;
      drivers = with pkgs; [
        epson-escpr
        epson-escpr2
        foomatic-db
        foomatic-filters
        gutenprint
        hplip
        splix
      ]
    };
    system-config-printer = {
      enable = true;
    };
  };
}
