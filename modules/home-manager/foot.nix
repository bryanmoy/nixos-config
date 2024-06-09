{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.foot;

in {
  options.modules.foot = { enable = mkEnableOption "foot"; };
  config = mkIf cfg.enable {
    programs.foot = {
      enable = true;
      settings = {
        main = {
          font = "FiraCode Nerd Font Mono:size=11";
        };
      };
    };
  };
}
