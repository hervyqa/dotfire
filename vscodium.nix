{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        apollographql.vscode-apollo
        azdavis.millet
        b4dm4n.vscode-nixpkgs-fmt
        bbenoist.nix
        bmalehorn.vscode-fish
        dart-code.dart-code
        denoland.vscode-deno
        editorconfig.editorconfig
        eg2.vscode-npm-script
        elixir-lsp.vscode-elixir-ls
        elmtooling.elm-ls-vscode
        esbenp.prettier-vscode
        formulahendry.code-runner
        golang.go
        haskell.haskell
        ionide.ionide-fsharp
        irongeek.vscode-env
        kamadorueda.alejandra
        llvm-vs-code-extensions.vscode-clangd
        matklad.rust-analyzer
        mattn.lisp
        mhutchie.git-graph
        mikestead.dotenv
        ms-pyright.pyright
        ms-python.python
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow
        ms-vscode.anycode
        ms-vscode.cmake-tools
        ms-vscode.makefile-tools
        pkief.material-icon-theme
        redhat.java
        redhat.vscode-yaml
        ritwickdey.liveserver
        scala-lang.scala
        shardulm94.trailing-spaces
        streetsidesoftware.code-spell-checker
        sumneko.lua
        svelte.svelte-vscode
        timonwong.shellcheck
        yzhang.markdown-all-in-one
      ];
    })
  ];
}
