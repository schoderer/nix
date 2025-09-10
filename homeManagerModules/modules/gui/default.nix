{pkgs, lib, config, ...}: {
  imports = [
    ./gnome.nix
  ];
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-GB"
      "de"
    ];
    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
          default_area = "menupanel";
          install_url = "http://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        "vpn@proton.ch" = {
          default_area = "menupanel";
          install_url = "http://addons.mozilla.org/firefox/downloads/latest/proton-vpn/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };
  };
}
