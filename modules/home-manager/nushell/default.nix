{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nushell;
in {
  options.modules.nushell = {enable = mkEnableOption "nushell";};
  config = mkIf cfg.enable {
    programs.nushell = {
      enable = true;
      shellAliases = {
        ll = "ls -al";
      };
    };
  };
}
