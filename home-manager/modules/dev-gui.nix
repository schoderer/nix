{ config, pkgs, unstable, system, ... }:
let
  unstable-pkgs = import unstable {inherit system; config.allowUnfree = true;};
in
{

  home.packages = [
      unstable-pkgs.vscode
      unstable-pkgs.jetbrains-toolbox
    ];
}
