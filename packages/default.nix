{config, ...}: {
  imports = [
    # basic
    ./archiver
    ./git
    ./ssg
    ./tools

    # programming
    ./julia
    ./node
    ./python
    ./rakudo
    ./scala
    ./science

    # editor
    ./ide
    ./latex
    ./rstudio
    ./vscodium
    #./neovim

    # desktop
    ./art
    ./internet
    ./mapping
    ./media
    ./nonfree
    ./office
    ./plasma
    ./theme
  ];
}
