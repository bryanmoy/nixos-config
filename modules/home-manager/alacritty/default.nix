{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.alacritty;
in {
  options.modules.alacritty = {enable = mkEnableOption "alacritty";};
  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        # general = {
        #   shell = "nu";
        # };
        window = {
          # decorations = "None";
          opacity = 0.8;
        };
        font = {
          normal = {
            family = "FiraCode Nerd Font Mono";
            style = "regular";
          };
        };
      };
    };
  };
}
