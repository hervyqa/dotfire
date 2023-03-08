{
  config,
  pkgs,
  libs,
  ...
}: let
  name = "hervyqa";
  layout = "us";
in {
  services = {
    xserver = {
      enable = true;
      desktopManager = {
        lxqt = {
          enable = false;
        };
        plasma5 = {
          enable = true;
          excludePackages = with pkgs.libsForQt5; [
            oxygen
            plasma-browser-integration
          ];
        };
        xterm.enable = false;
      };
      displayManager = {
        defaultSession = "plasma"; # lxqt/plasma/plasmawayland
        sddm = {
          # for lxqt/plasma
          enable = true;
          autoNumlock = true;
          settings = {
            Theme = {
              CursorTheme = "breeze_cursors";
            };
          };
        };
        autoLogin = {
          enable = true;
          user = "${name}";
        };
      };
      excludePackages = with pkgs; [
        xterm
      ];
      layout = "${layout}";
      libinput = {
        enable = true;
        touchpad = {
          disableWhileTyping = true;
          sendEventsMode = "disabled-on-external-mouse";
        };
      };
      videoDrivers = ["amdgpu"];
      wacom = {
        enable = true;
      };
      xkbVariant = "";
    };
  };
}
