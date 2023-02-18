{
  config,
  pkgs,
  libs,
  ...
}: {
  services = {
    dnscrypt-proxy2 = {
      enable = true;
      settings = {
        ipv6_servers = true;
        require_dnssec = true;
      };
    };
  };
}
