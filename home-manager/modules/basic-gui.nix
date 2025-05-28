{ pkgs, ...}: {
  home.packages = with pkgs;[
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    # Misc
    vlc
  ];
  fonts.fontconfig.enable = true;
}
