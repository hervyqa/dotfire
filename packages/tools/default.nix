{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      axel
      bottom
      bootiso
      chezmoi
      dialog
      direnv
      efibootmgr
      ffmpeg
      git
      glxinfo
      gnumake
      helix
      imagemagick
      inxi
      joshuto
      marksman
      nixos-option
      pfetch
      ranger
      tmux
      translate-shell
      vulkan-tools
      wayland-utils
      wget
      wl-clipboard
      xclip
      yadm
    ];
  };
}
