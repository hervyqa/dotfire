{
  config,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      (
        vscode-with-extensions.override {
          vscode = vscodium;
          vscodeExtensions = with vscode-extensions;
            [
              azdavis.millet
              b4dm4n.vscode-nixpkgs-fmt
              bbenoist.nix
              bmalehorn.vscode-fish
              davidanson.vscode-markdownlint
              donjayamanne.githistory
              editorconfig.editorconfig
              esbenp.prettier-vscode
              formulahendry.code-runner
              grapecity.gc-excelviewer
              kamadorueda.alejandra
              mechatroner.rainbow-csv
              mhutchie.git-graph
              ms-pyright.pyright
              ms-python.python
              ms-python.vscode-pylance
              ms-toolsai.jupyter
              ms-toolsai.jupyter-keymap
              ms-toolsai.jupyter-renderers
              ms-toolsai.vscode-jupyter-cell-tags
              ms-toolsai.vscode-jupyter-slideshow
              ms-vscode.anycode
              naumovs.color-highlight
              pkief.material-icon-theme
              scala-lang.scala
              scalameta.metals
              shardulm94.trailing-spaces
              shd101wyy.markdown-preview-enhanced
              streetsidesoftware.code-spell-checker
              yzhang.markdown-all-in-one
            ]
            ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
              {
                name = "language-julia";
                publisher = "julialang";
                version = "1.38.2";
                sha256 = "07b8c8748f85dfd99a5ff23eadf7c88e64b9f7e07d6adb2be6bcd7f9cfbe5aa9";
              }
              {
                name = "r";
                publisher = "REditorSupport";
                version = "2.7.0";
                sha256 = "385a57ebc52093b209d3eba9a66b9c2f069e7b7223e7a82e1af46b1c30337825";
              }
            ];
        }
      )
    ];
  };
}
