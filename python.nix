{pkgs, ...}: {
  environment.systemPackages = with pkgs.python310Packages; [
    google-cloud-bigquery
    ibm-watson
    ipython
    jupyterhub
    jupyterlab
    keras
    matplotlib
    numpy
    pandas
    pyzmq
    requests
    scikit-learn
    scipy
    seaborn
    spyder
    tableaudocumentapi
    torch
    torchaudio
    torchinfo
    torchvision
  ];
}
