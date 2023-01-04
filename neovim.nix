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
            set linebreak breakindent
            set list listchars=tab:>>,trail:~
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
            set smarttab
            set splitbelow
            set splitright
            set t_Co=256
            set tabstop=2
            set undofile
            set undolevels=50000
            set updatetime=100
            syntax on

            let g:mapleader = "\<Space>"

            nnoremap <C-J> <C-W><C-J>
            nnoremap <C-K> <C-W><C-K>
            nnoremap <C-L> <C-W><C-L>
            nnoremap <C-H> <C-W><C-H>
            nnoremap <BS> <C-W><C-H>

            nnoremap <silent> <Left> :vertical resize +2<CR>
            nnoremap <silent> <Right> :vertical resize -2<CR>
            nnoremap <silent> <Up> :resize +2<CR>
            nnoremap <silent> <Down> :resize -2<CR>

            nnoremap _ <C-W>s<C-W><Down>
            nnoremap <Bar> <C-W>v<C-W><Right>

            map = <C-w>=

            vnoremap > >gv
            vnoremap < <gv

            nnoremap <silent> <leader>w :w<CR>

            vnoremap <leader>y "qygv<ESC>
            vnoremap <leader>x "+ygvd<ESC>
          '';
        };
      }
    )
  ];
}
