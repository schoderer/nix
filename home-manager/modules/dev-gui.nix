{ config, pkgs, unstable-pkgs, ... }:
{

  home.packages = [
      pkgs.vscode
      pkgs.jetbrains-toolbox
    ];
}
