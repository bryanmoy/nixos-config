{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.{replace};
in {
  options.modules.{replace} = {enable = mkEnableOption "{replace}";};
  config = mkIf cfg.enable {
    programs.{replace} = {
      enable = true;
      settings = {};
    };
  };
}
