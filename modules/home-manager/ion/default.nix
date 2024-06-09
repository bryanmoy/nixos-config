{ pkgs, lib, config, ... }:

with lib;
let
  cfg = config.modules.ion;
  myAliases = import ../../../aliases/default.nix;

in {
    options.modules.ion = { enable = mkEnableOption "ion"; };
    config = mkIf cfg.enable {
        programs.ion = {
            enable = true;
            shellAliases = myAliases;
        };
    };
}
