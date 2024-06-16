{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.git;
in {
  options.modules.git = {
    enable = mkEnableOption "git";
  };
  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      includes = [
        {
          path = "~/.dotfiles/nixos-config/modules/home-manager/git/personal.gitconfig";
          condition = "gitdir:~/.dotfiles/";
        }
        {
          path = "~/.dotfiles/nixos-config/modules/home-manager/git/personal.gitconfig";
          condition = "gitdir:~/PersonalProjects/";
        }
        {
          path = "~/.dotfiles/nixos-config/modules/home-manager/git/qonto.gitconfig";
          condition = "gitdir:~/QontoProjects/";
        }
      ];
      ignores = [
        ".direnv/"
        ".coverage"
        "coverage.xml"
      ];
      extraConfig = {
        init.defaultBranch = "main";
        commit.gpgsign = true;
        tag.gpgsign = true;
        gpg.format = "ssh";
        gpg.ssh.program = "op-ssh-sign";
        gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      };
    };
  };
}
