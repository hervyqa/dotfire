{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs;
    with octavePackages; [
      octaveFull
      database
      dataframe
      data-smoothing
      financial
      fits
      fpl
      general
      gsl
      linear-algebra
      nan
      splines
      statistics
      symbolic
    ];
  };
}
