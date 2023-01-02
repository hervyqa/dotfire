{ pkgs, ... }:
{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override {  }).customize{
      name = "vim";
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [
          ale
          emmet-vim
          fzf-vim
          jedi-vim
          nerdtree
          purescript-vim
          rust-vim
          statix
          supertab
          typescript-vim
          vim-airline
          vim-airline-themes
          vim-fish
          vim-fugitive
          vim-gitgutter
          vim-go
          vim-javascript
          vim-lastplace
          vim-lsp
          vim-nix
          vim-surround
          vim-tmux
          vim-tmux-clipboard
          vim-tmux-focus-events
          vim-tmux-navigator
          vim-toml
          vim-tpipeline
          vim-trailing-whitespace
          vim-unimpaired
          vim-vsnip
          vim-vsnip-integ
        ];
        opt = [];
      };
      vimrcConfig.customRC = ''
        filetype indent on
        filetype on
        set backspace=indent,eol,start
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
    }
  )];
}
