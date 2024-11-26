{ config, pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    # Misc
    firefox
  ];
  programs.zed-editor.enable = true;
  fonts.fontconfig.enable = true;
}
