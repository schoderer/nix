{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode
    jetbrains-toolbox
  ];
}