{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    git
    (python3.withPackages (ps: with ps; [
      pnglatex
      plotly
      kaleido
      pyperclip
    ]))
    tree-sitter
    fd
    oh-my-zsh
  ];
}
