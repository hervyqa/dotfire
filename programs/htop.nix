{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    htop = {
      enable = true;
      settings = {
        hide_kernel_threads = true;
        hide_userland_threads = true;
      };
    };
  };
}
