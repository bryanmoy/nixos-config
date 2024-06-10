{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.helix;
in {
  options.modules.helix = {enable = mkEnableOption "helix";};
  config = mkIf cfg.enable {
    programs.helix.enable = true;
    programs.helix.settings = {
      theme = "tokyonight";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
    programs.helix.languages = {};
    programs.helix.defaultEditor = true;
  };
}
