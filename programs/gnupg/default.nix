{
  config,
  pkgs,
  libs,
  ...
}: {
  programs = {
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
}
