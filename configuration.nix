{
  config,
  pkgs,
  libs,
  ...
}: {
  imports = [
    ./hardware
    ./packages
    ./programs
    ./services
    ./system
  ];
}
