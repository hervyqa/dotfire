{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      R
      clickhouse
      gnuplot
      grafana
      luigi
      metabase
      tabula
      visidata
      wxmaxima
    ];
  };
}
