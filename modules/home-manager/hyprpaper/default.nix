{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.hyprpaper;
in {
  options.modules.hyprpaper = {enable = mkEnableOption "hyprpaper";};
  config = mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        preload = [
          "~/.dotfiles/nixos-config/assets/wallpapers/mountains-lake-water-body-minimal-4k-hz.jpg"
        ];
        wallpaper = [
          ",~/.dotfiles/nixos-config/assets/wallpapers/mountains-lake-water-body-minimal-4k-hz.jpg"
        ];
      };
    };
  };
}
