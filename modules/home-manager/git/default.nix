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
    home.file."PersonalProjects/personal.gitconfig".source = ./personal.gitconfig;
    home.file."QontoProjects/qonto.gitconfig".source = ./qonto.gitconfig;
    programs.git = {
      enable = true;
      includes = [
        {
          path = "~/PersonalProjects/personal.gitconfig";
          condition = "gitdir:~/.dotfiles/";
        }
        {
          path = "~/PersonalProjects/personal.gitconfig";
          condition = "gitdir:~/PersonalProjects/";
        }
        {
          path = "~/QontoProjects/qonto.gitconfig";
          condition = "gitdir:~/QontoProjects/";
        }
      ];
      ignores = [
        ".direnv/"
        ".coverage"
        "coverage.xml"
        "venv/"
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
