{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.waybar;
in {
  options.modules.waybar = {enable = mkEnableOption "waybar";};
  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          ##################
          ### BAR CONFIG ###
          ################EE

          # See https://github.com/Alexays/Waybar/wiki/Configuration#bar-config
          layer = "top";
          modules-left = [
            # "sway/workspaces"
            # "sway/mode"
          ];
          modules-center = [
            # "sway/window"
          ];
          modules-right = [
            "battery"
            "clock"
          ];
          battery = {
            format = "{capacity}% {icon}";
            format-icons = ["" "" "" "" ""];
          };
          clock = {
            format-alt = "{:%a, %d. %b  %H:%M}";
          };
        };
      };
    };
  };
}
