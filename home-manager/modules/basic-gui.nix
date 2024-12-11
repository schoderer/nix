{ pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    # Misc
    firefox
  ];
  fonts.fontconfig.enable = true;
}
