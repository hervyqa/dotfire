{
  config,
  pkgs,
  libs,
  ...
}: let
  name = "hervyqa";
in {
  nixpkgs = {
    config = {
      allowUnfree = true;
      firefox = {
        enablePlasmaBrowserIntegration = false;
      };
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      trusted-users = ["root" "${name}"];
    };
  };
}
