{
  config,
  pkgs,
  libs,
  ...
}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        useOSProber = false; # true: If dual boot.
        splashImage = null;
      };
      timeout = 0;
    };
    initrd.secrets = {
      "/crypto_keyfile.bin" = null;
    };
    kernel = {
      sysctl = {
        "vm.swappiness" = 60;
      };
    };
    tmpOnTmpfs = true;
  };
}
