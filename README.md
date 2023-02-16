# NixOS for Data Science

![image](img.png)

Minimalist configuration of Nixos operating system with KDE Plasma (disk
encrypted) for Data Science.

## Variable

Replace the variables below according to your data in `configuration.nix` and `home.nix`.

```nix
let
  name = "hervyqa";
  fullname = "Hervy Qurrotul Ainur Rozi";
  email = "hervyqa@proton.me";
  timezone = "Asia/Jakarta";
  defaultlocale = "en_US.UTF-8";
  extralocale = "id_ID.UTF-8";
  layout = "us";
  gpgkey = "85161EB8";
in
```

## Installation

* Clone source

```sh
git clone git@gitlab.com:hervyqa/nixos-config.git
cd nixos-config
```

* System wide config

Symlink to `/etc/nixos`.

```sh
sudo mv configuration.nix configuration.nix.bak
sudo ln -s $PWD/configuration.nix /etc/nixos/
```

* Home manager config

```sh
mkdir ~/.config/nixpkgs
sudo ln -s $PWD/home.nix $HOME/.config/nixpkgs/
```

* Install Home manager standalone

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz home-manager
nix-channel update
```

* Generate home manager

```sh
nix-shell '<home-manager>' -A install
```

## NixOS Info

* system: `"x86_64-linux"`
* host os: `Linux 5.15.89, NixOS, 22.11 (Raccoon), 22.11.1777.cdead16a444`
* multi-user?: `yes`
* sandbox: `yes`
* version: `nix-env (Nix) 2.11.1`
* channels(hervyqa): `""`
* channels(root): `"nixos-22.11"`
* nixpkgs: `/nix/var/nix/profiles/per-user/root/channels/nixos`

## Settings

Configuration | Description
:------------ | :----------
`vm.swappiness = 60;` | Runtime parameters of the Linux kernel, as set by sysctl(8).
`tmpOnTmpfs = true;` | Whether to mount a tmpfs on /tmp during boot.
`defaultUserShell = pkgs.fish;` | Defines the default shell assigned to user accounts.
`auto-optimise-store = true;` | Replaces files in the store that have identical contents with hard links to a single copy. This saves disk space.
`allowUnfree = true;` | The configuration of the Nix Packages collection to allow unfree packages.
`adb.enable = true;` | Whether to configure system to use Android Debug Bridge (adb).
`dconf.enable = true;` | Whether to enable dconf.
`gamemode.enable = true;` | Whether to enable GameMode to optimise system performance on demand.
`java.enable = true;` | Install and setup the Java development kit.
`kdeconnect.enable = true;` | Whether to enable kdeconnect.
`light.enable = true;` | Whether to install Light backlight control command and udev rules granting access to members of the `video` group.
`mtr.enable = true;` | Whether to add mtr to the global environment and configure a setcap wrapper for it.
`enablePlasmaBrowserIntegration = false;` | The configuration of the Nix Packages collection to disable plasma browser integration for Firefox.
`autoLogin.enable = true;` | Automatically log in as autoLogin.user.
`dnscrypt-proxy2.enable = true;` | Whether to enable dnscrypt-proxy2.
`earlyoom.enable = true;` | Whether to enable Early out of memory killing.
`fstrim.enable = true;` | Whether to enable periodic SSD TRIM of mounted partitions in background.
`mysql.enable = true;` | Whether to enable MySQL server (MariaDB).
`postgresql.enable = true;` | Whether to enable PostgreSQL Server.
`mongodb.enable = true;` | Whether to enable MongoDB Server.
`pipewire.enable = true;` | Whether to enable pipewire service.
`thermald.enable = true;` | Whether to enable thermald, the temperature management daemon.
`doas.enable = true;` | Whether to enable the doas command, which allows non-root users to execute commands as root.
`sudo.enable = false;` | Whether to disable the sudo command, which allows non-root users to execute commands as root.
`systemd.oomd.enable = false;` | Whether to disable the systemd-oomd OOM killer.
`defaultSession = "plasma";` | Graphical session to pre-select in the session chooser. (plasma/plasmawayland).
`opengl.extraPackages = amdvlk` | Additional packages to add to OpenGL drivers.
`boot.initrd.kernelModules = ["amdgpu"];` | List of modules that are always loaded by the initrd. (hardware-configuration.nix).
`autoUpgrade.enable = true;` | Whether to periodically upgrade NixOS to the latest version.
`system.stateVersion = "22.11";` | NixOS system release.

## Data science

### R

The list of installed `R` packages is in the `rstudioWrapper.override` section:

```sh
rstudioWrapper.override {
  packages = with rPackages; [
    ...
    ]
  }
```

<details>
<summary>See all module list of R.</summary>

```sh
Cairo
DT
DataExplorer
JuliaCall
JuliaConnectoR
MASS
RANN
RColorBrewer
Rcpp
XML
baseline
beepr
blogdown
bookdown
bookdownplus
caret
colourpicker
dataCompareR
data_table
datapasta
devtools
diffobj
dplyr
duckdb
dygraphs
echarts4r
esquisse
flexdashboard
forecast
foreign
freqparcoord
fst
geofacet
ggiraph
ggplot2
glue
gmodels
gridExtra
gym
here
httr
installr
janitor
jsonlite
knitr
leaflet
listviewer
lme4
lubridate
magrittr
mapsapi
officer
openNLP
openxlsx
optparse
pacman
paletteer
patchwork
plotly
plumber
profvis
purrr
quantmod
quarto
r5r
reactable
readr
readxl
remedy
remotes
reshape2
reticulate
rio
rmarkdown
roxygen2
rvest
scales
sf
shiny
shinyjs
spatstat
splitstackshape
sqldf
stringr
tensorflow
testthat
tidycensus
tidygeocoder
tidymodels
tidyquant
tidyr
tidytext
tidyverse
tidyxl
tmap
tmaptools
tsbox
usethis
validate
vetiver
vroom
xts
yaml
ymlthis
zoo
```

</details>

### Python3

The list of installed `python3` packages is in the
`python3.withPackages` section:

```sh
python3.withPackages (
  ps:
    with ps; [
      ...
    ]
  )
```

<details>
<summary>See the Python3 library.</summary>

```sh
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
lightgbm
mahotas
matplotlib
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
pydot
pyls-spyder
pyspark
pytest
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
```

</details>

### SQL

* MariaDB, PostgreSQL& MongoDB enables by default.

### Other languages

In addition to `R` and `python3`, there are also `julia`, `rakudo`, and `scala`.

## IDE

### Spyder

[Spyder IDE](https://www.spyder-ide.org) is a free and open source
scientific environment written in Python, for Python, and designed by and for
scientists, engineers and data analysts. It features a unique combination of the
advanced editing, analysis, debugging, and profiling functionality of a
comprehensive development tool with the data exploration, interactive execution,
deep inspection, and beautiful visualization capabilities of a scientific
package.

Especially for python programming. This package is included in
the `python3.withPackages` section above and is already integrated with the
pandas, numpy, matplotlib, scikit-learn, and other libraries.

### VSCodium

The [VSCodium](https://vscodium.com) Free/Libre Open Source Software Binaries
of VS Code. VSCodium is a community-driven, freely-licensed binary distribution
of Microsoft’s editor VS Code. Telemetry is disabled.

List of installed `vscodium` plugins (configuration.nix):

```sh
vscode-with-extensions.override {
  vscode = vscodium;
  vscodeExtensions = with vscode-extensions; [
    ...
    ]
  }
```

<details>
<summary>See the VSCodium extensions.</summary>

```sh
azdavis.millet
b4dm4n.vscode-nixpkgs-fmt
bbenoist.nix
bmalehorn.vscode-fish
davidanson.vscode-markdownlint
editorconfig.editorconfig
esbenp.prettier-vscode
formulahendry.code-runner
grapecity.gc-excelviewer
kamadorueda.alejandra
mechatroner.rainbow-csv
mhutchie.git-graph
ms-pyright.pyright
ms-python.python
ms-toolsai.jupyter
ms-toolsai.jupyter-keymap
ms-toolsai.jupyter-renderers
ms-toolsai.vscode-jupyter-cell-tags
ms-toolsai.vscode-jupyter-slideshow
ms-vscode.anycode
pkief.material-icon-theme
scala-lang.scala
shardulm94.trailing-spaces
shd101wyy.markdown-preview-enhanced
streetsidesoftware.code-spell-checker
```

</details>

### Helix

[Helix Editor](https://helix-editor.com) A zero config post-modern CLI
text editor similiar VIM or Neovim.

My helix configuration at `~/.config/helix/config.toml` is just this:

```sh
theme = "base16_terminal"

[editor]
line-number = "relative"
cursorline = true

[editor.lsp]
display-messages = true
```

### Others applications

**GUI tools:**

In addition to `spyder` & `vscodium` there are also other gui applications such
as:

* `dbeaver` Universal SQL Client for developers, DBA and analysts.
Supports MySQL, PostgreSQL, MariaDB, SQLite, and more.
* `octaveFull` Scientific Programming Language.
* `sqlitebrowser` DB Browser for SQLite.
* `texstudio` TeX and LaTeX editor.
* `wxmaxima` Cross platform GUI for the computer algebra system Maxima.

**CLI tools:**

* `clickhouse` Column-oriented database management system.
* `gnuplot` Portable command-line driven graphing utility for many platforms.
* `grafana` Gorgeous metric viz, dashboards & editors for Graphite, InfluxDB
& OpenTSDB.
* `jupyter` Web-based notebook environment for interactive computing.
* `jupyterlab` Jupyter lab environment notebook server extension.
* `kaggle` Official API for <https://www.kaggle.com>, accessible using a command
line tool implemented in Python 3.
* `luigi` Python package that helps you build complex pipelines of batch jobs.
* `metabase` The easy, open source way for everyone in your company to ask
questions and learn from data.
* `tabula` Liberating data tables locked inside PDF files.
* `visidata` Interactive terminal multitool for tabular data.

## License

MIT License

Copyright (c) 2023 Hervy Qurrotul Ainur Rozi
