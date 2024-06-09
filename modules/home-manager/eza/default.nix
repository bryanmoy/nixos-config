{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.eza;

in {
  options.modules.eza = { enable = mkEnableOption "eza"; };
  config = mkIf cfg.enable {
    programs.eza.enable = true;
    programs.eza.extraOptions = [
      # Display options
      # https://github.com/eza-community/eza#display-options
      "--long"
      "--classify=always"

      # Filtering options
      # https://github.com/eza-community/eza#filtering-options
      "--all"
      "--group-directories-first"

      # Long view options
      # https://github.com/eza-community/eza#long-view-options
      "--binary"
      "--group"
      "--header"
      "--time-style=long-iso"
    ];
  };
}
