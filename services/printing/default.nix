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
    };
  };
}
