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
        show_cpu_usage = true;
        show_cpu_frequency = true;
        show_cpu_temperature = true;
      };
    };
  };
}
