{...} : {
  homeconfig = {
    user.username = "michael";
    fishShell.enable  = true;
    dev = {
      basic = {
        enable = true;
        gitUserName = "Michael Schoderer";
        gitUserEmail = "github.anemic814@passmail.net";
      };
      kubernetes.enable = true;
      gui.enable = true;
    };
    gui = {
        niri.enable = true;
        firefox.enable = true;
        gnomeSettings.enable = true;
        additional.enable = true;
    };
    security-utils.enable = true;
  };
}
