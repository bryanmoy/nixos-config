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
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker = {
          hidden = false;
        };
      };
    };
    programs.helix.languages = {
      language-server.pylsp.config.pylsp.plugins = {
        rope_autoimport = {
          enabled = true;
        };
      };
      language = [
        {
          name = "python";
          auto-format = true;
        }
      ];
    };
    programs.helix.defaultEditor = true;
  };
}
