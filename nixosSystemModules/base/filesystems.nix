{
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    zfs # ZFS filesystem support
  ];
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;
}
