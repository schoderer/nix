{pkgs, ...}: {
  programs.fish.enable = true;
  users.users.michael = {
    isNormalUser = true;
    description = "Michael";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" "dialout" "libvirtd" "plugdev" "k8s" "podman" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO10xSRLGOMQgKTMlbIy0GHEBQ1u7Lio/FR5iLaGSxmC michael"
    ];
    subUidRanges = [ { startUid = 100000; count = 65536; } ];
    subGidRanges = [ { startGid = 100000; count = 65536; } ];
  };

}
