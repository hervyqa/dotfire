{
  config,
  pkgs,
  libs,
  ...
}: {
  hardware = {
    opengl = {
      driSupport = true;
      extraPackages = with pkgs; [
        amdvlk
      ];
    };
  };
}
