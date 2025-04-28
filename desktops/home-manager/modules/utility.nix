{ pkgs, ...}: {
  home.packages = with pkgs; [
    dvdbackup
  ];
}
