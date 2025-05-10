{ pkgs, ... }: 
let 
  probe_rs_rules = (builtins.readFile ./files/probe-rs.rules);

in {
  services.udev.extraRules = ''
    ${probe_rs_rules}
  '';
  users.groups.plugdev = {};
  users.extraGroups.plugdev.members = [ "michael" ];
}
