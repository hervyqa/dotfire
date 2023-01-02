{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        azdavis.millet
        b4dm4n.vscode-nixpkgs-fmt
        bbenoist.nix
        bmalehorn.vscode-fish
        editorconfig.editorconfig
        esbenp.prettier-vscode
        formulahendry.code-runner
        kamadorueda.alejandra
        mhutchie.git-graph
        ms-pyright.pyright
        ms-python.python
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow
        ms-vscode.anycode
        mskelton.one-dark-theme
        pkief.material-icon-theme
        scala-lang.scala
        shardulm94.trailing-spaces
        streetsidesoftware.code-spell-checker
      ];
    })
  ];
}
