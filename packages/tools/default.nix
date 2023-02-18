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
      joshuto
      marksman
      nixos-option
      pfetch
      tmux
      translate-shell
      vulkan-tools
      wget
      wl-clipboard
      xclip
    ];
  };
}
