{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.ssh;
in {
  options.modules.ssh = {enable = mkEnableOption "ssh";};
  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      extraConfig = ''
        Host *
            IdentityAgent ~/.1password/agent.sock
            AddressFamily inet
      '';
    };
    home.file.".ssh/allowed_signers".source = ./allowed_signers;
    home.file.".config/1Password/ssh/agent.toml".source = ./agent.toml;
  };
}
