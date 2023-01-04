{pkgs, ...}: {
  environment.variables = {EDITOR = "nvim";};

  environment.systemPackages = with pkgs; [
    (
      neovim.override {
        withNodeJs = true;
        vimAlias = true;
        configure = {
          packages.myPlugins = with pkgs.vimPlugins; {
            start = [
              statix
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
              coc-highlight
              coc-html
              coc-java
              coc-json
              coc-lists
              coc-lua
              coc-markdownlint
              coc-metals
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
              coc-spell-checker
              coc-sqlfluff
              coc-stylelint
              coc-sumneko-lua
              coc-toml
              coc-tslint
              coc-ultisnips
              coc-vetur
              coc-vimlsp
              coc-vimtex
              coc-yaml
              coc-yank
              scope-nvim
              scrollbar-nvim
              surround-nvim
              tabline-nvim
              vim-airline
              vim-airline-themes
              vim-lastplace
              vim-lightline-coc
              vim-nix
            ];
            opt = [];
          };
          customRC = ''
            filetype indent on
            filetype on
            set backspace=indent,eol,start
            set colorcolumn=80
            set cursorline
            set expandtab
            set history=1000
            set hlsearch
            set ignorecase
            set incsearch
            set nobackup
            set nocompatible
            set nowrap
            set number relativenumber
            set scrolloff=10
            set shiftwidth=2
            set showcmd
            set showmatch
            set showmode
            set smartcase
            set tabstop=2
            syntax on
          '';
        };
      }
    )
  ];
}
