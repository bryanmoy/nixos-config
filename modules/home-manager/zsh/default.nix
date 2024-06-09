{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.zsh;
  myAliases = import ../../../aliases/default.nix;

in {
  options.modules.zsh = { enable = mkEnableOption "zsh"; };
  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      shellAliases = myAliases;
    };
  };
}
