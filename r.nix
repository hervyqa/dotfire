{pkgs, ...}: {
  environment.systemPackages = with pkgs.rPackages; [
    caret
    data_table
    #dplyr
    #knitr
    #mlr3
    #plotly
    #qtl2ggplot
    #shiny
    #tidyr
    #torch
    #torchaudio
    #torchvision
    #xgboost
  ];
}
