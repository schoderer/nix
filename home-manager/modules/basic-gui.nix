{ pkgs, ...}: {
  home.packages = with pkgs;[
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    alacritty
    # Misc
    firefox
    vlc
  ];
  fonts.fontconfig.enable = true;
}
