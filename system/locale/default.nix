{
  config,
  pkgs,
  libs,
  ...
}: let
  defaultlocale = "en_US.UTF-8";
  extralocale = "id_ID.UTF-8";
in {
  i18n = {
    defaultLocale = "${defaultlocale}";
    extraLocaleSettings = {
      LC_ADDRESS = "${extralocale}";
      LC_IDENTIFICATION = "${extralocale}";
      LC_MEASUREMENT = "${extralocale}";
      LC_MONETARY = "${extralocale}";
      LC_NAME = "${extralocale}";
      LC_NUMERIC = "${extralocale}";
      LC_PAPER = "${extralocale}";
      LC_TELEPHONE = "${extralocale}";
      LC_TIME = "${extralocale}";
    };
  };
}
