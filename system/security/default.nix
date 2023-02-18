{
  config,
  pkgs,
  libs,
  ...
}: {
  security = {
    rtkit = {
      enable = true;
    };
    pam.services.kwallet = {
      name = "kwallet";
      enableKwallet = true;
    };
    sudo = {
      enable = false;
      wheelNeedsPassword = false;
    };
    doas = {
      enable = true;
      extraRules = [
        {
          users = ["root"];
          groups = ["wheel"];
          keepEnv = true;
          persist = true;
        }
      ];
      wheelNeedsPassword = false;
    };
  };
}
