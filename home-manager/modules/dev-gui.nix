{ config, pkgs, unstable, ... }:
{
  programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "toml"
        "html"
      ];
      userSettings = {
        theme = "Andromeda";
        hour_format = "hour24";
        auto_update = false;
        autosave= "on_focus_change";
        features = {
          copilot = true;
        };
        load_direnv = "shell_hook";
        ensure_final_newline_on_save = false;
        inlay_hints = {
          enable = true;
        };
        assistant = {
          enabled = true;
          version = "2";
          telemetry = false;
          default_model = {
            provider = "copilot_chat";
            model = "gpt-4o";
          };
          
        };
        telemetry ={
          metrics = false;
          diagnostics = false;
        };
      };
   };
}
