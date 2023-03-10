{config, ...}: {
  imports = [
    # basic
    ./archiver
    ./git
    ./ssg
    ./base

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
    ./octave
    ./rstudio
    ./vscodium

    # desktop
    ./art
    ./internet
    ./mapping
    ./media
    ./nonfree
    ./office
    ./plasma
    ./theme
    ./tools
  ];
}
