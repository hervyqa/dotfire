{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs;
    with octavePackages; [
      octave
      database
      dataframe
      data-smoothing
      financial
      fits
      fpl
      general
      gsl
      image
      linear-algebra
      nan
      splines
      statistics
      symbolic
    ];
  };
}
