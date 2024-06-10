{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.git;
in {
  options.modules.git = {enable = mkEnableOption "git";};
  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "Bryan Moy";
      userEmail = "dev@bryanmoy.com";
      extraConfig = {
        init.defaultBranch = "main";
        user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPvMq/Zpl7z9G5EOv9lfI7XK+U4SnNSq9PMGU6Kv7SaC";
        commit.gpgsign = true;
        tag.gpgsign = true;
        gpg.format = "ssh";
        gpg.ssh.program = "op-ssh-sign";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      };
    };
  };
}
