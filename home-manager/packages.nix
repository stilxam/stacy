{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    git
    git-lfs
    (python3.withPackages (ps: with ps; [
      pnglatex
      plotly
      kaleido
      pyperclip
      jupytext
    ]))
    tree-sitter
    fd
    oh-my-zsh
    tectonic
    zathura
  ];
}
