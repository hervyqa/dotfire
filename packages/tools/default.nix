{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      axel
      bottom
      dialog
      direnv
      efibootmgr
      git
      glxinfo
      gnumake
      helix
      htop
      imagemagick
      inxi
      marksman
      nixos-option
      pfetch
      ranger
      tmux
      translate-shell
      vulkan-tools
      wget
      wl-clipboard
      xclip
      yadm
    ];
  };
}
