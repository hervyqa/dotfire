{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      (
        python3.withPackages (
          ps:
            with ps; [
              Theano
              av
              baseline
              beautifulsoup4
              bokeh
              click
              cython
              dash
              dask
              datasette
              dill
              duckdb
              flask
              future
              grip
              gym
              h5py
              ibm-watson
              imbalanced-learn
              ipykernel
              ipython
              ipywidgets
              jedi
              jedi-language-server
              joblib
              jupyter
              jupyterlab
              jupyterlab-lsp
              jupyterlab-pygments
              keras
              kaggle
              lightgbm
              mahotas
              matplotlib
              mkdocs
              mkdocs-autorefs
              mkdocs-jupyter
              mkdocs-material
              mkdocs-material-extensions
              mkdocs-minify
              mkdocstrings
              mkdocstrings-python
              moviepy
              mypy
              nbdime
              networkx
              nltk
              nose
              numpy
              opencv4
              openpyxl
              pandas
              pillow
              pims
              plotly
              plotnine
              poetry
              pydot
              pyls-spyder
              pymongo
              pyspark
              pytest
              python
              python-lsp-jsonrpc
              python-lsp-server
              pytorch
              pyyaml
              qdarkstyle
              requests
              sagemaker
              scikit-learn
              scikitimage
              scipy
              scrapy
              seaborn
              selenium
              spacy
              spyder
              spyder-kernels
              statsmodels
              sympy
              tableaudocumentapi
              tables
              tensorflow
              tensorflow-metadata
              tensorflow-probability
              tifffile
              torch
              torchvision
              tqdm
              trfl
              virtualenv
              virtualenvwrapper
              wordcloud
              xarray
              yt-dlp
            ]
        )
      )
    ];
  };
}
