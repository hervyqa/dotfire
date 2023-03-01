{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      atool
      bzip2
      gzip
      libarchive
      lz4
      lzip
      lzo
      lzop
      p7zip
      rzip
      unzip
      xz
      zip
      zstd
    ];
  };
}
