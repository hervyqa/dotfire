{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = false;
      media-session.enable = false;
      pulse.enable = true;
    };
  };
}
