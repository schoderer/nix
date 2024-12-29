{ pkgs, ...}:
let
    libbluray = pkgs.libbluray.override {
        withAACS = true;
        withBDplus = true;
        withJava = true;
    };
    vlc = pkgs.vlc.override {inherit libbluray; };
in
{
  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    # Misc
    firefox
    vlc
  ];
  fonts.fontconfig.enable = true;
}
