{
  config,
  pkgs,
  libs,
  ...
}: {
  sound = {
    enable = true;
  };
  hardware = {
    pulseaudio = {
      enable = false;
    };
  };
}
