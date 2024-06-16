{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.nushell;
  myAliases = import ../../../aliases/default.nix;
in {
  options.modules.nushell = {enable = mkEnableOption "nushell";};
  config = mkIf cfg.enable {
    programs.nushell = {
      enable = true;
      shellAliases = myAliases // {
        ls = "ls";
        ll = "ls -al";
      };
    };
  };
}
