# Data Science

![image](img.webp)

Minimalist configuration of Nixos operating system with KDE Plasma Wayland (disk encrypted) for Data Science needs.

## Installation

```sh
git clone git@gitlab.com:hervyqa/nixos-config.git
cd nixos-config
```

Symlink to `/etc/nixos`.

```sh
sudo mv configuration.nix configuration.nix.bak
sudo ln -s $PWD/configuration.nix /etc/nixos/

```

Replace the variables below according to your data in `configuration.nix`.

```nix
let
  name = "hervyqa";
  fullname = "Hervy Qurrotul Ainur Rozi";
  email = "hervyqa@proton.me";
  timezone = "Asia/Jakarta";
  defaultlocale = "en_US.UTF-8";
  extralocale = "id_ID.UTF-8";
  layout = "us";
in
```

## NixOS Info

- system: `"x86_64-linux"`
- host os: `Linux 5.15.89, NixOS, 22.11 (Raccoon), 22.11.1777.cdead16a444`
- multi-user?: `yes`
- sandbox: `yes`
- version: `nix-env (Nix) 2.11.1`
- channels(hervyqa): `""`
- channels(root): `"nixos-22.11"`
- nixpkgs: `/nix/var/nix/profiles/per-user/root/channels/nixos`

### Settings

| Configuration                             |
| :---------------------------------------- |
| `vm.swappiness = 10;`                     |
| `tmpOnTmpfs = true;`                      |
| `defaultUserShell = pkgs.fish;`           |
| `auto-optimise-store = true;`             |
| `allowUnfree = true;`                     |
| `adb.enable = true;`                      |
| `dconf.enable = true;`                    |
| `gamemode.enable = true;`                 |
| `java.enable = true;`                     |
| `kdeconnect.enable = true;`               |
| `light.enable = true;`                    |
| `mtr.enable = true;`                      |
| `neovim.defaultEditor = true;`            |
| `enablePlasmaBrowserIntegration = false;` |
| `autoLogin.enable = true;`                |
| `dnscrypt-proxy2.enable = true;`          |
| `earlyoom.enable = true;`                 |
| `fstrim.enable = true;`                   |
| `mysql.enable = true;`                    |
| `pipewire.enable = true;`                 |
| `thermald.enable = true;`                 |
| `doas.enable = true;`                     |
| `sudo.enable = false;`                    |
| `systemd.oomd.enable = false;`            |
| `defaultSession = "plasmawayland";`       |
| `bluetooth.hsphfpd.enable = true;`        |
| `opengl.extraPackages = amdvlk`           |
| `kernelModules = ["amdgpu"];`             |
| `autoUpgrade.enable = true;`              |
| `system.stateVersion = "22.11";`          |

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
<summary><b>See all module list of R.</b></summary>

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
beepr
colourpicker
dataCompareR
data_table
datapasta
devtools
diffobj
dplyr
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
vroom
xts
yaml
ymlthis
zoo
```

</details>

### Python3

The list of installed `python3` packages is in the `python3.withPackages` section:

```sh
python3.withPackages (
  ps:
    with ps; [
      ...
    ]
  )
```

<details>
<summary><b>See the Python3 library.</b></summary>

```sh
Theano
beautifulsoup4
bokeh
cython
click
dask
datasette
dill
flask
future
h5py
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
pynvim
pytest
pytorch
pyyaml
qdarkstyle
requests
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
```

</details>

### Other programming languages

In addition to `R` and `python3`, there are also `julia`, `rakudo`, and `scala`.

## IDE

### Spyder

Especially for python programming. This package is included in the `python3.withPackages` section above and is already integrated with the pandas, numpy, matplotlib, scikit-learn, and other libraries.

### VSCodium

List of installed vscodium plugins (configuration.nix):

```sh
vscode-with-extensions.override {
  vscode = vscodium;
  vscodeExtensions = with vscode-extensions; [
    ...
    ]
  }
```

<details>
<summary><b>See the VSCodium extensions.</b></summary>

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

### Neovim

Neovim plugin management uses `coc-nvim`. The list of installed plugins is in the `neovim.override` section:

```sh
neovim.override {
  ...
    packages.myPlugins = with pkgs.vimPlugins; {
      start = [
        ...
    ]
  }
}
```

<details>
<summary><b>See the Neovim plugins.</b></summary>

```sh
coc-clangd
coc-clap
coc-cmake
coc-css
coc-denite
coc-diagnostic
coc-docker
coc-emmet
coc-eslint
coc-explorer
coc-flutter
coc-fzf
coc-git
coc-go
coc-haxe
coc-highlight
coc-html
coc-java
coc-jest
coc-json
coc-lists
coc-lua
coc-markdownlint
coc-metals
coc-neco
coc-nginx
coc-nvim
coc-pairs
coc-prettier
coc-pyright
coc-python
coc-r-lsp
coc-rls
coc-rust-analyzer
coc-sh
coc-smartf
coc-snippets
coc-solargraph
coc-spell-checker
coc-sqlfluff
coc-stylelint
coc-sumneko-lua
coc-svelte
coc-tabnine
coc-tailwindcss
coc-texlab
coc-toml
coc-tslint
coc-tslint-plugin
coc-tsserver
coc-ultisnips
coc-vetur
coc-vimlsp
coc-vimtex
coc-wxml
coc-yaml
coc-yank
julia-vim
scope-nvim
scrollbar-nvim
statix
surround-nvim
tabline-nvim
vim-airline
vim-airline-themes
vim-commentary
vim-lastplace
vim-lightline-coc
vim-nix
vim-wayland-clipboard
```

</details>

### Others

In addition to `spyder`, `vscodium`, `neovim` there are also other gui applications such as:

- `dbeaver` database processor.
- `octaveFull` numerical calculation matlab.
- `sqlitebrowser` sqlite database processor.
- `texstudio` document processor `LaTex`.
- `paraview` data visualization.
- `wxmaxima` numerical calculations.

Other tools:

- `clickhouse`
- `duckdb`
- `gnuplot`
- `grafana`
- `jupyter`
- `jupyterlab`
- `kaggle`
- `luigi`
- `metabase`
- `tabula`
- `visidata`

## License

MIT License

Copyright (c) 2023 Hervy Qurrotul Ainur Rozi
